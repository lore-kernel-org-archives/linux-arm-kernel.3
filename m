Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uEo229gv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yp5wOBuY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeeSY22S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=; b=uEo229gvKkQ2Qd
	L7oAUiukFhWiJ4rwLewa2+nDPpKXS5eiC57dkhHyBA+M3YS4H3fzClwBuK9y8SfdQij2+LqrE0z2+
	fN4ygdB9O6cW47vnih+KcYEyGubDobT2jFiRbXpYvZoOdOPIysHfwLoiuEbSg65ujErYfjhH1AsHD
	JQq8BwOZP+sn8ULc4+rJuYchKhoOAeqlMgCH+ODzblbwwczPiKNZ0sCglzbynBq3gym1M52tHrvw0
	F2a5VMdrK0DHFziVoxTADnrYT0CLs9OdC5oVbHaZLfCflHzKb7+9mYNmoKRI1RLEBDuPUH9pB9j5E
	pR/P5NqI6qu93QgRR0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnA3-0000000BoFs-047n;
	Fri, 30 Oct 2026 14:00:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9y-0000000BoDZ-3uhZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:00:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnX0U1869005
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=; b=Yp5wOBuYUvaZ9G8H
	Y1Ge9H+4Uez+7kLRVDPNkz4UIdvmsydhiWxon7uANhBzMmnRD4gl4ktaeTi7mg1s
	e0O0BgJCK0RC5wjWI0qIafUgGDuhxHpYBQDi5Wq+ocDWDCGq6cVCNarTRp9nmrhL
	w/1K3hutLf4UKu83ZkdzgXoKWv1CPqy0/LBn2Dpm7ff5xpkl19H13Fn8+HXVwJQJ
	jonaNFWMxz/1aG0P98FMwkS8WWWzGZF5MkDntYotkgojATsIDlO08MftH9z5v6Ce
	l+D8tzVXSZfHpPU4HJ1K/LUz7NvfuyaefcFPpGSPbPHr6vXgV43GG/GFuf6ct9bZ
	GpjimA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkc8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:00:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso13036765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368845; cv=none;
        d=google.com; s=arc-20260327;
        b=HN6YisGKxuDyYdJk/fDwMCaPDeETw72Hlmjn97nb0r+7g/Ie6euuLcKbdlXCyWgf5i
         l3blG4XOp4aNVb/cuBwT68TakgxpjXbeUvxxlj+AfxdGDXOGUa8t+pELAtYySPMIZcoz
         LjBqyf711x9IJrpTKuowTms6ABbR95VsRJhhwAr1Yu19qU6RkVR7sW6o+eI/4Bx/S1uc
         Wk/kBFMJ41EjTNIqEBn+PSs6MLfVFNUwAUOXX8zcx3A98GUqM3H6XFZxKXCp4u8Q2hKe
         5ocxHHBcNro3HqCZSQN830NEb7NKCoEHUW0QZKaI2wqiuqKfyDK0+DTa0bWy5SxpG7EC
         U4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        fh=/Mzk8+rc3NN2C0RL7sBMg//521yPFVLlB+6eRH6ZViI=;
        b=mPYTVxpipqPhG1eS2z1ie1Iuxz/COaDgiy6bmEKps1BNq01bIWSqZk8BOcABxfyQLP
         TsWC16SUi1PfOaZ4SbIm6HgKV20cnOR8A99fwMx3CxevzRAInXElY2m8V2x90PuR+vRD
         ihZT3A0S4kVPFJCU2KYSrY+nmNUPFEEQSYzEzOTlpZVDQ1rFWdaGIcqsDnm1B16ayL4H
         nmUgB+drHpFOnw3TeEh+0AyQYmrQA98FESOQRUpPsa6PKv3YYwhigCl0KW1/CtHmWyfP
         PXXWPnmjkadUPFk8PpOApt3SrG4jE2AzJI819VNY1ajwGnj4/f1MdaaBDQrkL7rMRlMz
         t8cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368845; x=1793973645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=ZeeSY22SYZ3+0qVddy6N6Heis+QfMR2hdk9sAsi9sosSWlzVxbDqbYDYU+EIosuiRM
         Bbr+qoN3vwBIBog5J4aILdp13165Dwi3HuIZ0Ya6vQd4gXMBNsKQndJsghoi8QocOR+H
         HXSGHYdOiwmrOaLTfYQzfjPOXY9kr4hAfp3hm7fhNrXQmHb2Qm7umsuZ89Xid8BKqaBK
         em2qbPWpoVWTAlvCc9FGBebRC+0bsvfsiNvZczi8HOsqtfDUxpWURRM4X+co1IaQsFQk
         A0MYxbaGUJeYs+Bj5GyfgQXZxSC3zfU23I5C/ITX4Atqm8rkkhbjNTDyVOAp4Yo8A1Nh
         zwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368845; x=1793973645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=xNgYrWXPV+THDeDWYFqL/60QnyFeCqgHTAnL8WPp/QXNZn7TvdirlTgprjCJkYumre
         OIYkXiwudrjQ4MCKD0s4RPMzU0RhZqcfXXteUoXrxRYOXjwr8wzXbKBd6jiCXlHzDgvR
         U8e/GjdUji7EbHjHc4nD01xnHTAGPY/nIW357+pX2rbg/D/9jukPbChFIk/xA8w08+rH
         mu6oOGnZWA3PQQrfOl2FGYdkQRALCPcwhVnER2KP6bsU0JPiYnZABXk+bi8fxZSGjK+w
         GJbN6MPflW9+zI1r83Eiuc4xJylbP9eWaGC0OQkXxFcZdAnONrgMTm1wbxH6/3BoHQYo
         N9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxDKA3HeHEfJNGTjTUovTq6HEDo7FwUw7hFIl1xFOq1HNYlvxaLrJ08ZTmrHF0HR7oJcDZ3ZHeC0WuusKGzkiiY@lists.infradead.org
X-Gm-Message-State: AFq9FYJRcmx8auDc5nAM1bp36/1TMcMpfkVwetL+FwG6E0tN7FjUiuUE
	WAd6yUYcsnQ7nKxTyU0J9Qp0TRcS/ILGnt9XLc6YLnlkcb6XYIo7TdtxJmRA69RkZGGQt6sxRx5
	NdFMcdRxnkLZZJRjY8nQ3RDUxQVLq/EwVMgXvgNAbEryRz9xnzB5NHXoxEUuszcoZu1+14dUC9m
	gGCmS4hpuGwA8OSs6lptvBekILfgJWah7Y8WKUClHAUcjnsAsCPCqb6FJuj9Y3
X-Gm-Gg: AYBFou3FmhkODV74JJwhllkQiWrR3ZDZehwuJ7YC1Bc8GvIZL+VMYL494GBqo+lSfTB
	ZIJpExMiUoLUCzPG7PA/AEVKaa6HMmeIloEozvY+ShcTg7bE0ZlWU4K6N32FOtv02WWBmyPbqeY
	1llyVx4CsX5ERzlc42DlcWu7vvglfNK1H07tYi4gskc/mi/vnKoj88arj4CA==
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2eb364552bemr27295695ad.34.1793368843526;
        Fri, 30 Oct 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id
 d9443c01a7336-2eb364552bemr27295385ad.34.1793368843102; Fri, 30 Oct 2026
 07:00:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com> <20261027144002.10606-2-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-2-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:30 +0100
X-Gm-Features: AclHuK85D2yzjqjadIBbGwA5No_thmVDaWhvxFw1u5vv5w3KPYrH4xdvCoOE_dE
Message-ID: <CAPx+jO844b4kY9vbJPJj+N5H9cRJ4TzT52=1yU-Pi_oxqysd8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX3CzMy3lN7MeO
 ejnhPEpy1R1DDkYHtAmIHdgqBUESN6IcnAexhOeO6451+14yRdEj+p+4SlMPAYMsNbCGODSNX47
 /PxdjjaCSCRGIA/fh8HqxUk8eKOF8do1UI2NTlnGJd4MlM76+eRoLSlqUUrkrC0oR+3nmA29wQS
 8x+54Z5JIez27ABgdVPtHXl0KyNQisLATkEh+e9hpveF2OP5hykb8uYLDysrlgm77buC0Zy5Ggo
 perh1cR2FgrscagMTI7rxFWwTFvnm/6IibU/rx1orv9uLavuyl2SNJ4w60IkV/io9/t1ZatlHrV
 SA3j+rhumV/gBa0+103h1S1E2NHBosI4mIRYTJF7OIS6LpMtT0R0rbOcAXutcDpMX1LU+kNO0c9
 ILhjew/1+Z6HgXzgbo38NLjceVZqme/+uNDkUXj8JwcIhneT0LkxObVPELcI4PDKKucycIQYfj3
 J3JrylvNjLh39Pa/tJQ==
X-Proofpoint-ORIG-GUID: MXZE1RS6eLXdE09QI8Z2CXTrA5J43BFZ
X-Proofpoint-GUID: MXZE1RS6eLXdE09QI8Z2CXTrA5J43BFZ
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4a30e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXwy20guliCfdV
 U6eHPY7ouQiRwiS/eMpUQ95qLry/1fo5Tx+kTe3xmochtmYrJ30ipD2WOiyA9Vi20KnaQKGb6YB
 ATWRvVgXJwCCoo5NKME9tEZ9oPERl5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070047_046918_F23CD160 
X-CRM114-Status: GOOD (  19.95  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
> MMC controller based on MT7988 with the difference of having a single clo=
ck
> controlling it.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 5b160fdad3f0..736cff2783e2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat =
=3D {
>  };
>
>  static const struct of_device_id msdc_of_ids[] =3D {
> +       { .compatible =3D "airoha,an7581-mmc", .data =3D &mt7986_compat},
>         { .compatible =3D "mediatek,mt2701-mmc", .data =3D &mt2701_compat=
},
>         { .compatible =3D "mediatek,mt2712-mmc", .data =3D &mt2712_compat=
},
>         { .compatible =3D "mediatek,mt6779-mmc", .data =3D &mt6779_compat=
},
> --
> 2.55.0
>


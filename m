Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA46606AC03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NwVs0XWl;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoN5mx08;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BmK0z6jA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=; b=NwVs0XWlOE3Rgq
	Q3wy7/dEG10xWtgH6UsHH+41VuLMI0JBaXmWCI0+PSIhRqSaeeKio9cg/LHb2MNjKm2g1BEIXxGP5
	XStFTC5qrH+qqNASCAbSD6HBpHKlCsRFmD3XIktVg1hnHRA3q6nwY1CGbAXDAMA1/R6bbLz1Agy9s
	/gf1GwChMw/BilY004bh96N2l0z3KkufyTrzmG8RhkgIvWpEHQZaMhKczPm8Or95o4dgJ15PANcI8
	iKpTJPEwSjBtM1PH3gj0ojZl8GKvxhmMxu+/3MAOo2s9tBkfdYGTx0tqYnWfM9MGZdM62UBscnw5l
	LQZo+dj2AdOF9r5844hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKp-0000000BTr3-3MaA;
	Fri, 30 Oct 2026 10:59:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKm-0000000BTpj-3BPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:59:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FAs72134764
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=; b=FoN5mx08YJMEym5Q
	rgXbClm55skGvq4gNRlOdq3VYj5bvbzTVDcDlzPDAfW2MBCLQpT331mdy1eBbaJ/
	/7BVMVBBszlN4oUHv0gPezwhdeyVijSytqhboPbeT7xM6EZ0ccfy8dlweducXX/N
	q82t80W2DpqBfcMZsLacaTuavA4WkryeZQGbD6gJQ2ifRuEpWxVarNVORqlPbrMI
	KQPOC0Zx/ZmogLXzEQTpOuK80NdtABggXJe1AyhEinXsZnlbeQQzO0WgVJVO4ucP
	ETs8cseSTsYNqB/r3G1Y6hozHOerakapy+NBcEQo7pH3h+ZyCspbbTxOMKUsTh4H
	LfVVcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjjpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:59:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so590583a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357983; cv=none;
        d=google.com; s=arc-20260327;
        b=Jl7wBpWG89vVLw0Ob62PfitI1398f6oozQrGOgqfJ9y/ujzo3Mi1tCUBx/BH+tPEyw
         kw6oF1zUzTcJn53ASJbQ/Wsv2ABrqne97BBqlS2OgqPzOxrNfr3NeP4MvkK0hPQqOwtn
         xKfYJ6KpqyQBk5eyonNFhq9q3TyJVqUY8r5OdR7BuqEdDi7vnsoOiQkuKN/pmiPrWdUo
         8aKByzbd8Z0Ernu6tJnSzcgO0aMndnO6uUDq5/GM9w6vkEufKCRQ28dDVD/X4lVKCMwf
         SGwdrxeQRj3CfCmlWZePyxwDyep1oVKP0Zb6BVKIMNfTWOeNVQnRWHPVbooHfyomExin
         0dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        fh=Naktyfdr+nblt0jiaExKo//wvFd2Jef39y/2VDKXlZ4=;
        b=CQrIgkGwG64pj83AaetdvjLS10OB4rIAHrp//OE1sdkkdPgfWesuLfAXg11rrnYlkJ
         /aX4ZC6I/loRunTUtxWpKMeH2am8K+AUvhQ5qPbtknEzhDY8uMHsBFra7VVSy1PS/D06
         IwnfOJB14gVh73Ypsq6x0PrwdWvingiNXy2HfqMVEpC9CeQ7kz7P8D4N0FEntyGNTxg4
         D3YGQYYEzDiiDOqfdQ64eZxD2LV/Dg33wzJ4rr1XbXfuTbYZMeL42TcwUe2O+uhYhp07
         urGacgPURbeh0RuST32iJrKXyrHW7kMB4NvY5x+j4l6qpF73aAc5if8GSqOqiHXRpeYE
         AA4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357983; x=1793962783; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        b=BmK0z6jAns8vUIBHeU+0WpHL+q39yfyuMQPQGvlZqK0pDv7W11gOu+JC1lSNAvjWfs
         Gyu8mVtseJIOAGMff9BZFgAYdl8PGwu5kBscZys8zg/vcqOZeMHRSOdPcQsUXJPuBiaY
         7XIwL8QKjqYhcG6u72TbjwxZdPFQq3Vbio7RjbuTCAa1dvwqTRZW4sKGDFwLKNhy0mcN
         IGc6+29aZXR9EaS03kSSK1SFVyCrMK8AqH0tEdDu4sBSJmFb3bnqd0ynlDgNJjov2751
         qQky5xK6n85fhStc+Bd+zdPdDnSADJO2Go4g+itSuQDncYsytuKSbrOa50UDGGDImlbq
         f9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357983; x=1793962783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h0VoqWdyEGPZhM02EobSUR6ttbQ5ta3ZpYxlyDqGzY=;
        b=uNbgalHXUxnXolco65UVZ9KVta/WXqbeftPHUHUhZmMqK6b+3JNFc4Zlhy0GHRGZ3D
         ioZg8tyFbj5xZG2zSs1rzq0ClAPHVHQ7iBesXMXBapeTmiOAUPKA59ldGB5mYjLhMWGw
         3vSiLiUPwnISP+Cz47MB30kCUtF6ocAmSe1ULT3334XCHMrUCp/o5GpV/bgZtLdJNOa4
         nhFXtIuUYFmQeyU1T4+pKEudsw44t2jf+xIUcGcULpMOUaLgkuGwPuC3hXaugXn1CFwW
         3tvPpOOeLp7vMT6fxfOUE6TlWJURJTNX7ebrD+d73YP0sYOZfqvGiVPxK9teQ7v0j2K7
         BhCQ==
X-Forwarded-Encrypted: i=1; AKwUvByGEZSZF3eFj5a30OMZp+yCO02WzbmfLsPTaWQOfCyDiJ99N4UEaj9sD/GhinMfOfvThUKl8y4gthhjWSZcwvqS@lists.infradead.org
X-Gm-Message-State: AFq9FYKJUW2LMSG08ghLuDboylJaxNHqoBbVsE+MQEFrSNwt9ijjVYe5
	xr9rokqTVwc599s6RAg/jMtYMWN1CnbXLUjiBnTYoFuoydjNiKbiITb/FmuDTrHZMzHL5c/7RzE
	exnkFRYwYmOADAoHk2mKyCLf3pEuOO/1un77h4eCj1Q8exDP++w1EtAuNsjtTaQrzDjIbuDEVmK
	dNVPRxdXRMOmz8kmPXaBkMdVrG+EyLy0M10fuke8ENSPaNgpTsoBkk
X-Gm-Gg: AYBFou32JcZ1fdL1OBEgl7sVXDa3InyRp4M9CmpYLVb+sYo97BnxJimd98RIC6z3nua
	OgHJU7uh4eYczokG3CkZMXp6tMe9IHs9YlzWuWGQ5ov31ThIgMCEXMWvHRqHJML4keqyCMxDomA
	pstBBDW786h0z169dgqiAauUbZ2dcQtdKssNgn9ZKjaN/jomnGcZ2CdUqCPA==
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ae8984ec60mr1499293a91.51.1793357983151;
        Fri, 30 Oct 2026 03:59:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id
 98e67ed59e1d1-3ae8984ec60mr1499273a91.51.1793357982451; Fri, 30 Oct 2026
 03:59:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
In-Reply-To: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:30 +0100
X-Gm-Features: AclHuK_ToRvM7ToPCV5jS32tMVtZ5JO73u8yLnSIIXc_hjp9eNCpwZsxviWTqwQ
Message-ID: <CAPx+jO9tr__fFj6ftwbd+VP-GAA66=T8DfHgcDcZLhHhEGY=og@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] mmc: meson-gx: honour the busy timeout for R1b commands
To: iav@iav.lv
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX6yHEa//tOziG
 rUzO7/IdcFvgNpojW7QZaYX0dmBXFZSDc1d6XpzDNeN0FOVrhBDpN7yqJgdD5FvhlHesz/iPcCz
 HI3jlR0wodrPJdBvQUjx5fTiOAm+jqdTNXovgoTYXTTSLav9uBrYHJizdm7f1ICWNQvLSoj6CD+
 lCh7Udg3ZSMe/S75iE0aqiLGTK5NxFtsVzqbcTsPTnO9diOtfzaTphqRC1AP3XxTLOVLt/m7iKh
 KQVbBViiHlo+fN4rsAiVP48oJAt0Ghbi5aFQkbFWFRhtrRMJcKiS2xh7mQ4BuKmi4oxSo0NhX6c
 /sv4XOvO8aiA2dPQtMnaCxJ/MNRqi8LeTTL8ka+IdA/zgEL12E9NOJZo2vZAlZg9KQNE0ElgSP3
 V62xIZukSq+0nk9Ba6kbNgHEtQfzAOQfG42A5jJdlEuY5h6NtKgpmaV+0yAa25AV6JslObfg6J/
 3j5LdM+Rz+k8EKe7SlQ==
X-Proofpoint-GUID: tDfbyVcPOTWaIklFN9WVH9_OEMsLZzq7
X-Proofpoint-ORIG-GUID: tDfbyVcPOTWaIklFN9WVH9_OEMsLZzq7
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4789f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=r9kgVt4VC4hP7zZAK8AA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX20KtUU+aPeuO
 5aAnEKm0iec9tRR983BgidlRC6C8wjsZnz/b18KrzOL2fyt4QTxljEaWx6BOlndkECFY1mltfqJ
 cFfZB5F+XJJ4l+hnsYtTDTssI6OVKPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035944_826208_F2C9572C 
X-CRM114-Status: GOOD (  24.41  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 9, 2026 at 7:03=E2=80=AFPM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> For a command without data the driver programs a fixed 1024 ms into the
> CMD_CFG timeout field and does not tell the core how long the controller
> can wait for busy. Erase and cache flush then fail with -110 on eMMC.
> Patch 3 fixes card_busy, which reported a busy card free; patch 4 makes
> the core rely on it.
>
> Tested on ODROID-N2+ (S922X), 256 GB eMMC, btrfs root with discard=3Dasyn=
c,
> Armbian builds in docker as load. Without the series (7.3-rc6): 262
> errors in 3 h and 68 in 2.5 h in two runs; the first came 4 and 43 min
> into the build. With v1 (7.3-rc6): 0 in 16 h, 2.4 h of it under the
> build. With v3: 0 in a 37 min kernel build and in a 20 GiB write +
> fstrim; a sanitize went out as R1 and the core polled DAT0 for 523 ms
> until the card was back in TRAN. On 7.1 with the previous eMMC module
> a synthetic test (20 GiB write + fstrim) gave 48 errors without the
> patches, 0 and 0 with them.
>
> ODROID-N2 (S922X), 128 GB Kingston eMMC, 20 GiB write + fstrim:
> without the series an erase hit the 1024 ms limit and failed with -110
> in 3 of 3 runs. With v3, in 3 such runs and a fill of the card to 85 %
> with rm + fstrim, 5 erases took over 1024 ms, up to 1219 ms, and
> completed; 0 errors.
>
> ODROID-HC4, SD card in SDR104 at 1.8 V: 0 errors in 5 boots.
>
> The timeout is rounded up to a power of two: the field holds powers of
> two only, and the timeout is a lower bound. MMC_CAP_WAIT_WHILE_BUSY is
> not set: I have not checked that the controller waits for busy on every
> R1b command, HS400 switches included.
>
> ---
> Changes in v3:
> - Clamp cmd->busy_timeout to the range of the field before rounding it
>   up to a power of two: the rounding of a value above 2^31 overflowed
>   unsigned int (Sashiko).
> - New patch 3: card_busy reports busy from DAT0 alone. It required
>   DAT0..3 all low and reported a busy card free (Sashiko).
> - Link to v2: https://lore.kernel.org/r/20261008-meson-gx-busy-timeout-v2=
-0-8bde1adfb5b4@iav.lv

The v3 applied for fixes, thanks!

[...]

Kind regards
Uffe


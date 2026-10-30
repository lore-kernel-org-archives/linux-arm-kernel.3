Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12343606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nafkYte8;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHDI6toP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq1kMLmo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=; b=nafkYte8mLvzU/
	q4ndy2TGOOm70sco9BkO3voolzSNU02qStkmod9U8TKmYfFuSlZVdFEtTru6egAFpqiBQEaXaYzNU
	kVFP2bW/mKSozLsLvVkx40AwaOgfrBS20j27RQ8UyffEjddGjKwSQIKkNb+O/BKGU7Y9JL2lkzf9t
	QYJyY12LLfGLTqKaDfDkO4iEURuTCgv1Wkuv2QHf2NuFvhJAuvFSO7RE7kLphRuHyVsb2ITz84H/b
	Gh2E0lbg4LXHE0Y2NeBClJR473B2iXQ81PrZZ7mu68ph2EqBmTR+B52cG7SJuJhh9nVkTZrzRNXEj
	07EZF4LcoQ5spTIxQS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9v-0000000BoAd-1J7D;
	Fri, 30 Oct 2026 14:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9s-0000000Bo7u-3K8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:00:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDneJ04057685
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=; b=IHDI6toPVOYrtJFP
	z1ZskiucSL9zaQF1sOyXvlzXXmXLcY6WxvfQOn8yxwZ/hYxEfwFWQ/xNVWoXwEAw
	pi2RJnDNfhF1UY3r1JVkL39V2aGWfVLebudH4SncyDQbgusv+q053AUMKyXiydcu
	Xuuds3tuDj36SZThVwg7WNX+iTMThoNIdbLdehPh7qg+SsNrAl41CZj8mGPab3aC
	IzSvs1s97jhg8gczI1Lc967TPUvwZW3AZO3Od2RD79WhwlAtEum8sDjTCmqLUOnB
	b2ChyMvzXr5LPhJDFH+YAD9wCpqfVYMRl17krS0QAmuFPTV0YMDCQfCTL3T781mK
	o4VBYw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6quawd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:00:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0589ff620so592038b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368839; cv=none;
        d=google.com; s=arc-20260327;
        b=LF5YarmketgshwOygpxLIIIHKxCG/SE0YOH8PfcS0OFWakeXWneQo/hOhJDSM9XRXb
         6Bj6Q8RW8V6BsBllsWQ9LaynW8MAfXQHeWpgXPqbK8HA4aXxN+70EnIw/Za0Dgi8Gm2Z
         JSNUYyXEvaXC+aJS33+viVg8xBJ91J44/RoZbQBzgRpx2y50ESIFOWtxG6xzIv6bURiM
         RJDLanThfpKaEgR8b87g6k24s2dc8RfNj0LnzXuIO5tLGoSbYCsvrb6A+6EBvlEwhy/U
         s2pXWTVGe6G7oHgXNS0wYefQcI4LZOPU21xXiqnWopp1M5XkaIINPIKreD8huZRhd6mh
         hQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        fh=itG2gRkcEJlUBphhAiF5kcS9zcjGgguBsXCEk/hLjQM=;
        b=eDD/TxUfn1Y33wQmRjDbhz3hF0HjTvjW2Jxy7KUnknhlmhsq9uW930MHagDnH6vWqW
         OemwCuwSlPkLSQastvHIQmuGRAcKVBSWPxfNlbkMVANtCoCZqWpPMfAfhEva7uIpP31r
         QkSJb0F5xs3k83ID9KabOAg3mHpUiHRAdg+DVeDMRu6gzrKJ46CBCjDKmaydy+vqqtU5
         4r9jq7IApJzSEtwoylyV1B/cPWxSLugQ7gpNR967/iVjkuUTprrRT04XLF2y4JrQJRPD
         RXld8jrOA51iFfPvuNg83fQ0etYfVgAr52aLLG1MndjVfKN2RyNxlOe7s5igRGVApfRd
         9e9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368839; x=1793973639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=bq1kMLmoLAkfwjnAx68MYCv2i+ZTusvweFdbW87K/NbhfCz11IRB/bE+LthDI6knEt
         sRZBHVxp5gN7aWMMFsHhJC4HDYMuBPElgjaTBIwbdxY5jt2Q967uNw+HrXDBxfnFSw/Z
         gZT+8mjQZ8hnyuITmivp0s2EZ+v2vxdDGtrCggZBw/jm02eG6yU0GUbzKXm/I+BqBjqF
         yze+nnUoIKk4hh89421at6kA2Pgywmqk04x+k6w7vhjTnvd8aWC5Q5mqo3BNxsi1dNfD
         YtcpqSJvF8DSOiz1cqhk4e/ttYyr4pS7OrETmg9OStGCX0DGMhLnDLkrH1GSlvnvc2tA
         A2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368839; x=1793973639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuitTymSSoEUqo8wxOrof9T+ZUTGPTidse28qGJb34o=;
        b=DXLsHQ2zZ6HnYpA6U5r0ZjCYN5H9/sNYnITMp7Y3wRfVul2yoiYCidi1dsyIlo5ZR5
         /53vfGFOziKtgsHFKb7scAfQkrgI9rntz2qVwiP0Y6d3MMkpcN4+ym1nPMc+61BlIorq
         w0VgqGx4HONJjfphNKl11iXizKIg26yZeszLdaNVk2a8a6aTI+C3ul28Dp2nP0Z5Xk6r
         1yzA4wpJuE44OJ5RlDk4wOCUoZDcdLJmm2qXtXTq9+0KaBuPaVJUO+pNAau5dqnjXj78
         jhNPERW+KA6thN1vwcCYcYzLzdWpkDIoN+4OiCA7bxNxvQ/KFjTmZfWV8WCGd5f+2Cu2
         Vh5A==
X-Forwarded-Encrypted: i=1; AKwUvBxUvASq/1drrnt1XYuPUKBZwVAuCB0sMxV01vi85w3zcvdjp4mGaM9i+Ylw6MNNhNdDDzBpi0whAyYf6mKtIWT5@lists.infradead.org
X-Gm-Message-State: AFq9FYLYTQ+12G1vUfOXH5w54ehmcVBXXkpPdIpM5cCPOXKLDjQtLst2
	dSb7g/se0AzI6tixQiokX1eGVHOGr+YBWC9vY8INITJtey7Te+zYvn1HA2YZ+oM3DUK77a2vAMf
	W1gThu/nR0hm5/+jfbII6jILVElvMbPXxB0Rgyr/hd7htRMfXRu+fCC5urRVZodDgz3FrACavje
	Zg+ocaF56jhyWr8bp9mlf4/R4InocGPBvSqyEQpJrZtuuCwrFgGCxQ
X-Gm-Gg: AYBFou0gxM/STe3w4Ea+DwZtLPzpgqNiRfq10V7sTp5Z5ujgjoLqFju5l3H8AZRKrzu
	tshX9MBODCCb6vxEylPA7RDisWUNNqyqYlb1qS0NOZocb1Obsv3HM69Qwur2A7hnytqPyUR5zGp
	77+PtK5D1EW1kpcQr6OKhL/LvDy5g9aIBeB9OIxqxPZ09wQYu0FJN8wFfgVA==
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr2174619b3a.58.1793368836915;
        Fri, 30 Oct 2026 07:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id
 d2e1a72fcca58-8a9c098ab29mr2174559b3a.58.1793368836406; Fri, 30 Oct 2026
 07:00:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:21 +0100
X-Gm-Features: AclHuK-MTjfwt2OQzyBtwa_iraZJVoORJ1j_v3oQYZTa5jWvtZ6sOZH5C5h4Bak
Message-ID: <CAPx+jO-TT=UAhH5=5DEPuu1XtVvvE_QA_1V=9qw1moZJoPUU-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
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
X-Proofpoint-GUID: gTBSDA5Tt61y8q4mwuuYwAgWKOroY6th
X-Proofpoint-ORIG-GUID: gTBSDA5Tt61y8q4mwuuYwAgWKOroY6th
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXwSZ2haglId2/
 aN43vG43PS0E7pl+BsrOGVvqhgBQVLIgm7qKyUr+v66zi5nRh22ht6dDJW8kvY6TCAEi671+Cru
 vdgKaK4mTLQSLoSp2HJ2PL5V7SV2Y3bfNwepMQ8jJ03dpmDFdHkSHnJykmmA75Gk/XqkubZYhiw
 /hASqC2/Nj8+aj+qITfcQUd/NIXzKIjeLf2gSrkNWTsughWXL8SvO75/fg/um1ZoAHn7rcCN62W
 XLlKM6gH8Zqz3h2Lozk34Y4Bs0/93SdFyOF7sMuFLYNiolZAW2Up72xpu6LxHdQ19D9YyahuHXA
 IFQGMRoy7sHGTxuRz14v+RqpCTrCwRQO60lJgV9bQ9kXtXupM0+KjdD+8C8TV1GO9qnQVYGq086
 pzZJvIbi3Z1pBuPkqvEAm5eC0N99H4iJHg5c4ttnPUVnXnDYBYa3eLIt+mw55GeM+pAtQmsSE7t
 Pdj5h8CI/bGnrXigLHg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4a307 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX2j91kOvZnt6L
 h8Xew9lDGFq0eGgyBz5lVY2aZUcDWMPuH8gxsHlY6l/fqIHSPBvbqYZtUfLN9ryIXMahaUY9IxQ
 Nr0mngGkWE7SKX6U0q+cn7RbBFmUhCM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070040_978862_85F1846C 
X-CRM114-Status: GOOD (  19.98  )
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
> Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> The MMC controller is based on the MT7988 with the difference that it doe=
s
> have a single clock controlling it.
>
> Add the dedicated compatible to describe the 2 register requirement and
> permit to define only 2 clock (the main one and a fixed clock for HS)
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes v2:
> - Also add compatible to restrict clock-names for source and hclk
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index a4d032224dce..704d59360bcb 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - airoha,an7581-mmc
>            - mediatek,mt2701-mmc
>            - mediatek,mt2712-mmc
>            - mediatek,mt6779-mmc
> @@ -182,6 +183,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - airoha,an7581-mmc
>              - mediatek,mt2701-mmc
>              - mediatek,mt6779-mmc
>              - mediatek,mt6795-mmc
> @@ -238,6 +240,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - airoha,an7581-mmc
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc
> --
> 2.55.0
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3961CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=; b=GFmH6B4QK5kO6D+knWq6nX79OO
	e91Au4btNC17dY3xJRidJ1hEnEGIolil/ffCSehi299QObz65Fws8a7WlsDLHwbMS2VtA8k9QlTuh
	lkqWEx0KxBcU19Tp7bEhqinRMPq0YFtDKirdTzc/VFJLUyXpkP05eF1cwRXYh+dv5GTcdHRsndss6
	E8QAIHktXzJuN5uz8Y/8KXTFlEw1ybqvlfw31EdKKctWkbDRbJsOwJjBK16G/lvcFlPNT+xwIrDpY
	CGeBN71oNhllC99atuatlfUBmzdYRByVUlQeKYwhyGf+lvS+KmAbPj/0s9UNGQUHABO6m2IspCI7R
	cH+LEZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsa1-00000005BOF-1lYb;
	Tue, 09 Jun 2026 09:17:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsZz-00000005BNq-39hR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=; b=dsVdDSXC5y8ys8up9MG3NdxeT0
	Le8ch2VgbqM89m9YSnyeoN1pJnXMemg3VlZteG1kAZCNOTjElbSL1aTwwHC36wnwelVWyHUc/SfyT
	t3zUYwts7h792y2ma/cxbt3NplomC9Qs4CRx1yrXsKmsmXP059mi4P3G90L5K3JNANb+dq2EDbU0d
	l7JmFdD8npR3nZuCC6EDfAxkmt9KGIS5jZLWUX5Wtsoa6Ev1VvHlERlMSDC4fSscr84SqLAt5OpAc
	4mVRgvX34d9162fRwYflbuMAm/XguioGN5EWaVmBfDPqNcwuZ2tnrdsqeIRUPcSXF/P3jKDuuELam
	/vYsYJUw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsZw-00000002EbR-0Smj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:17:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597reqv2025860
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=; b=UiZHzBLy4QyYM2Ks
	N5cm8P4GmceWbdMF1milaB0NUBQ8s4AgwRDCssevYujEjrAkBVTA4jO923lz9Wl2
	mHZLwHJZ9r9GTahp9dh4aqaIUTEyNiNYXD/1BiR1nRpKEwItt8gi/hY2+yWnGwp3
	kyDaQuGvCbrGquG6a87/sKd7qD3wBldP0Xf+ZCbT2dZOzOl26cLaMs2Glnpoa4KU
	CO8NGAjzC7sA+NRQxoXibKITV7Gj1Lunrh4O3pzo71nKvSo42DeUxG3zmdSyIc4A
	zWGSKMrq3mauzlsp5t4fkd9M8ITdZMiMRsQiJz8sP+KKviNRtBfXyj7JamLklmbc
	CSh/XA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8ngrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:16:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156ceb551eso1010379785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996617; cv=none;
        d=google.com; s=arc-20240605;
        b=P0gkG0GLrmEPyJ3PpbLn8bUyDUciUSLY9i5lfXIS9m2gJA3Ev2b3pemc1F0kB0ZMn2
         VI7Sn9ZGcgdM/WaqG5ShI6rIPWe2PfgqDq4Kx7h1/TQ+IYNQaieSZKUvyeyKRtDdFp6a
         kfrrwvz9vMdAlyFHLHYUJswS1zxXqAX9Nr5VSxod9cvlbB/DS1V176Rs09jragr3pYMy
         nxgkvYJUU9Rksi6J21D5uhbj1vgKWLmW+91oofSblsElawF61CgbOHdnFaAOtn8at7s/
         t8cvRIf+VMA0VxhL0iKWIiBIU/NQLzRt66bBTkO2uQN53NB/9JlLOTFKkAgc/DgDN80q
         Vrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        fh=80dEZvNWWzTORwMi9M7mlOfarjwdLqHDnbC260mkPL8=;
        b=L4H4UKIA1KTq/m8He9oZQuY5Ac0Tauo0cdz/8/P+gi9SAGP59duyqmVK5ViYpxdicc
         pFrWFymGmJI0o7IgZtMvaitgVeq926Ru+7F+Iso9/zGNIPbKR0foLnk+B58/8sibA3mX
         ddTswTjMhw+MQMhFUO43xV7FrTbxKCfzw3/0rmOMBNikM1uVEewZnbbaishwkA6eDTP1
         g5OzEJ/KtjGNLoC9OUk7FhdtFFzVsYMn19gMD34ZDikks+RO+rOFTkLDrhXw4DkdKaa9
         R+2+1ZUQwpUVfdw9T2pTf3J1OjS8te3wLkwxXrpiNSjmFrtGXQVkfkL5UgNk5RtBgn7z
         sVOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996617; x=1781601417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=Qv9cP2ElK/QSZCFhq89EKX7XFgwmUXPts4dkAi9c6B9T6UullioD8tYY4GB1nsQKOl
         yGkHz7+LuHR30FhALBoTKavNNXmRcrusVRHKnGO3Uxzoul/DweqA3u4wdHF92Tc8Pi55
         FmVDiuQq5P26cp7NgvXYh9OwK8UKWINXz4lsNt8/54VYT9czKtItQC1xKPzXK2t1LIGF
         TNocpmE6LAPMb7E5RVokSsmgJ28myM7DVs0btHc//QjhHyYhW5v7Aq5oPlyImZ2/CmJk
         IX6FzbwxPXYQKUZCzJOqfeCNxllVhbxIS1Q3+EinEs/BVSg35E5sV8/pKbr+v3/m2Gne
         Rz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996617; x=1781601417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=Zf7Vo6B2JXyz0A7veCnPl0Y7u5yq64yoUu+MR+2XLuAp0f3TyWQNbRqFeqdtdtNJT7
         TuwFFW6NRfpcfsaly56io0k3fpFRc7KcblKT2WChCQonL8VS1g+Vl86+CjD7j9oVA1A8
         fYvxyKbUjY36nxN6/MViNqywR8mjmMINT4H3HIQQ8YZdFO3ivF06uzaQVZG61S6k9GX4
         Rhm+PeyZMUzxPHWwCHzSufOCwSK+Cacz78uOo0qCwz2C601G4yGGOJYBzp3xkAwq2Ybh
         0WjCjHEYoIqigzf5Vp0m5E4KBqOI8VC78MabEghoUtwvRN1SQMADNg4r4ufiS3CnKwqU
         7n2g==
X-Forwarded-Encrypted: i=1; AFNElJ/6mzD089bItWpt7qxsc4N4shrNJgkYxkVMkVuwdfU1tDEdaShACesaXZrVJyssTXZ54hoObTxCY1d2zJIBVhX3@lists.infradead.org
X-Gm-Message-State: AOJu0YxcY/WUSnjlyUleTJSlk0ZcyJMNaMzZYptszU9WGIu7G1PvQnOW
	01ndEnwLJd2FOlM8LMNkcL0PMkgFBOZ9fNg4iCEFDS3SAvTC+zZ0paHApSPdHg3eUExSQrl9s4m
	VySREjDeUgjdtEnQDt9Ipv5M8vG9MTQPkZhTewghcHxCjJSOQhVLFlL0RNrKeyZ8XFfcrPAdtQg
	y2wl8mHG32EXCLUCHoBCcZF9U2WRy+r5OzbpNZ8Z0nHQrN56EbMyu2
X-Gm-Gg: Acq92OFALrNEG0Y0Ci5BnXB4fKYlsXezKXyaUsM06mBLmIUsfG6hi0nbIphK7qstyY3
	L2Eal62WdpdN2cTo+1E7AqChvu3WgFgZDgh/8wmcweGTdcN4aAMZbB7kYvWH9z6Hi7hATfxaruC
	8szW6029X3cVIRDr1dHs8K/wq4/jQzNhIOLPfOyoNkuMljTk4VUhzu9OQpfsx7eqijkO8a048oU
	C+DTP9NuM79sw1FKb0GJ7B9Ti/OHdQkt19rb4qAIlD8xi0qNje/qmas0sAyqqrayMbtFpZ+bcXd
	sU3sApfx7W8vABFrqRrLWmCCMDP5wLhhDdPQvPnoTxr4GpnOrr87uvdH1rKu
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id af79cd13be357-915e822bf5amr252718085a.4.1780996617402;
        Tue, 09 Jun 2026 02:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id
 af79cd13be357-915e822bf5amr252712085a.4.1780996616898; Tue, 09 Jun 2026
 02:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com> <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:16:44 +0200
X-Gm-Features: AVVi8CcruF8G3bHCMvT-UUyCre6c8b-WOyhsQAf9gtMqJA6eGNVQ_TK2SNIM-_k
Message-ID: <CAFEp6-2V_srCT=wWFb5Pjrhq2-pzTG5QCd90Pf+0s92qC6G8LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX39Vi8Qf5qvwT
 sLkVhY0H2pjda4QF1wrjHotdqkDK8YupYGegIzGxE4XwvAKmlOCRqAANP2ZIH29Ll1N3QVDiRFy
 y9fzxrFvrghCQcwHuFKb6LSGGQeDX6UrbS6zAp3ezbBKTTsJBqTb8xC3H/wHghrYMYCz3w55ooB
 w7XGb6yH/aJy3TBADZrYSw/WOVDPxj4uIGg3+I8X/SKVvOCCL8xIy9r45+bbDnW1QTU0EajIwpK
 cR3pJ7EHnsybuCifwJ6NIDIsgCZyKSeUoazXN3aAdimFGX8D41XItcvIFAq+BzAl0IJlXcEsHTb
 2j57OMfTPWGY1qJSGx/OTv6fiEZk66af5IzR2Ao2dEpXoZ4RXK7iSgdiIFYQXSnV5ISHVHZDJAH
 BUdbI3rOUe9eaexd9j3wZvFHjtWVziiwV+SPA2J5oM1IGWeb7JHwFUqCiCLmHCnkwLGpww08yuG
 /pWhXH5M797fjYRJ3oQ==
X-Proofpoint-ORIG-GUID: MdYpvCBBMDKtnYNFiNohjYwaPhYzEsF-
X-Proofpoint-GUID: MdYpvCBBMDKtnYNFiNohjYwaPhYzEsF-
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27da0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8
 a=b40KZWPJp5KrgtGOUacA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=DZeXCJrVpAJBw65Qk4Ds:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_101700_819374_97FA2654 
X-CRM114-Status: GOOD (  15.54  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jun 8, 2026 at 4:07=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49=
e2de7dc7acdc29a 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -137,6 +138,7 @@ allOf:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
> +              - qcom,shikra-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
>
> --
> 2.34.1
>


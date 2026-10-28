Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69641606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LG5ybNtF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WietkvLB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=; b=LG5ybNtFDHtMAsB4QAt5qmB7hf
	tLa2LSELHewbJq4seDkR6GkxsrywjXPHKG+icuw/68rOMdfrR6VbYd1xm7ob7rvBhcAz2iqgHhc3n
	Y2mtEVhJHJR+jhSabZzVKqwrFiuW/nWgjcPf5dG4TSOLZhVE2GiECd1ZE0MHMlcvahXF427tTQBVn
	YRw9QrXRpFmsX1BRW0ol9QTwlYY9QrVy4k9Vaj7m3yrxN8eFVg1NOAdiODFTmqtf54sL7WeNz9WZM
	nEdmR1YuRRmNKT/8jIKWZpDK6su192eEDbxVU5ey16mW+403Gt+O2adVVTnMWd3jMxsu6HyWXQqiP
	5wlVc5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwqE-00000006OO6-3v5T;
	Wed, 28 Oct 2026 06:08:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwqC-00000006ONP-408i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:08:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4Phuq046881
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uauo5EdXcDHHpx/dkq/cusNt
	5B6yHqZfuqoNAuipezU=; b=cOuO7GasIJQDmxJW6aX7tgMxZlEkZ1xq2eVbeLBB
	wxfIcm9jEyr2Qwv/wJ5bAxlJjEXvUhAN7x4Ub8wruvzLUq25a9jeDZaKoFadl3ur
	jaa7zXEpnUNFtDOweaskDDqvtMsGsB9AaWq9LHdo0tIjmfE3/s/yv/L1/kXextN7
	G8YUJS6lIRuMmi+LE9+ioRO1Ndo+hI2ewQShh1E7EtgtMk+ChlgHpdhj9P4F8Ku/
	b5+TMt04d9cDmpQ7yYrvb1ex1P0FUVWUIFzUtdy575jHFHScf2lZlIwU+Ja8jFd8
	IVt0JdtQh694kjn6feVAxQd/1lXQIzG7VSe3t75Azujpng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82trpf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:08:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e94f72fb9fso5486145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 23:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793167730; x=1793772530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=WietkvLBLdmR7bNDVbyj+QQ94T1Tn0GPDQXtfV2sA9jeXAdfJGoUZBLg5oxYqyPPpM
         p0Qaw7jbHfMGrJzqF0gQAm/TbrHSUUkl5Z1IfAAJgvfDQiDvdhVXZKq0yU5umRd2ESfZ
         uooAfSdILWglrZU2HDOK73a23/d800T7WVy7pnNVBcRidrdX7gkVjCEkuCj9SV+BcL1X
         vg6HRKzW8l2uXoNPFLt702FQUkBwuwf0djf+74BZ2p/7YEvvR27OvF8CWGdTfo9jVNk8
         0OSzYIUbfbb4X9lqKBIiisD9ELinYEWmGeIgkviPJkBCLJdUo/QKRzK6gy574yDy74s1
         Yw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167730; x=1793772530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=CV7/c0bK86CHKjE93FPpbyAm83EeaK5TDNLG5LciAJxv39+OjMOeDdNjD25WxfKMxq
         f33QC2MPVTTy9rW/okE9ZyFYzpKs68BkNifKRSjiVGzj3bhYzmQHme869Mt5g8eNG8mw
         hq0TutF7moRhKR1rcGibxYOi8JA76Td7U1wA9Yw2b6DkzjVM6HT4O18D5I6TjGOei/3R
         1/rqVN7+M3zkQj/slqDUbM1Iq2XTKSSwNcQ1eZjAEvIbO+ngr446i7Ye4v/p365jbE/G
         Auxmdp8YJq79Iq+4vtTjYwWun6J9HH4Ll4lEraGO5tuIaF+C8h4QdQiFgu9lcm+8qwDr
         N6gQ==
X-Forwarded-Encrypted: i=1; AKwUvByvc7UXvTH1IT3JYgAic2vgTAA6KTaLrslrujMFx1p/zurixDfK1Ic/q/JlhH6NQW5WJXiEjpborhxIo9daEmi5@lists.infradead.org
X-Gm-Message-State: AFq9FYIg0EoaA1etwyCAn4Xf2DpOUey8GIr4WYtX+Wlo9praOCNlO8y0
	9Sm4MSPFKfsSDnq4RX3e1gxBQcfecSDX71GOXt0n9g4biLhpHNho7/Xu5unGrEuFGOJIBd3GddB
	/FsrSGX9s9ojPIcOwjb13YXKBY15iUGs5FWzzMkpWGLba0RbB8O20tIiKBraMfAgTzoRVriiuRG
	NLJw==
X-Gm-Gg: AYBFou2/WTCc21XH0avylqqZ3/uN4ThAKTLAGnYSkudIEcSkLq+luNdPrLPROdjRxmp
	sRrJjXX+rRjQPjwXsjnIDG+stt8iEv3ZZR0jtCup9pjC7xmx5O5hj1wZtz9N7dQEp/dgybMZGM5
	IfjPxnQwPlIVUbZSStAAiPyZGBqlIpUDiW4JlkXwazJjMJ2T8SmIF7hJttZL6E7n2FwSFqySaJ6
	rhIhH9UD4R4GuIy5yCCqpfqovGGVO0vuYg/3Un2oOS3jLKWU1oA5jeEFKTl61CCQAyz0M4UnVIN
	vQ+npYzm7crsFHWoPSkGfZ3suW4VrJPSf1ClwBOOzkX5Bfc1oTjnqHHYPFj7Isdfnpyuh9QBHWb
	mUnvfk2Z0Tke7JfA1lAlhXHdS2Kpb6ZoaBAG+rblj+hQK/X22opMs6wmAROIYGkLQy/D79kM+oy
	JBjzz1
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183325ad.31.1793167730201;
        Tue, 27 Oct 2026 23:08:50 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183035ad.31.1793167729742;
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdd5cesm17410795ad.30.2026.10.27.23.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:38:41 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
Message-ID: <auGRabyU1mLKsgNG@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
 <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
X-Proofpoint-GUID: Ci5iv_sBqfONkoxWR_adFPVvdIMkxkL9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX9kxRreKT/p6/
 UfyRJ2u//GrGJ4v1XQsIzFpYUg5uvcX9qNccwErIVSWeh3Mepp8Adgn7o8M2KsxiciNtxtza7YF
 9j1X1Nt97FQWgD+MQCa79DmyXkoouvk=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae19173 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Ci5iv_sBqfONkoxWR_adFPVvdIMkxkL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX0V6Ivw9VTwfh
 LbWgtN2AAin8PH1k8BX2Y4D0Q16yO8B2BxDvV6JJgtzcJnk04UwmJEb9d0nFiIQJKjlpwv/ORRE
 yxLR0jvEgnPFHROSO/dtFlg1PVu+Xf1PVPIKOBwpZ8/CoUUUfSbElwpEVJLiCZ3Ie77Aqjv30nw
 4aIdftXZJfs1tTVT8m2S4TbHbweT3p5A1JfAFTUyRtmGO8gobR+igoX+reWI5d9lR2A28LWW1+E
 SUsesU5Sln1SQ7wy5d1wbJLwBG+W0mGrFK4B1l9Mfun5SO64dlAsuWA5xKO8nHH1r+zDsN9tV7A
 u+fPI9btUitcA0hfn1FOmwDK/3aWyRd9UcrcVzmTo6b7MxZyjfAq8PnXJXThQ4wz2e32ZdQxtTy
 InCCdZxeDKGLLubAZ3EqhASQQUJhJExG5QGGgDhEjYLBCOzBYnHHHOoc5aqf4gCUSgsABjUUi5X
 3i1feIAlun4bcfky7Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_230853_109531_B6C43F87 
X-CRM114-Status: GOOD (  16.57  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:04:58AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> > default on the Talos Lyra EVK base board DT, to provide HDMI output
> > on the DSI0_B2B connector on the carrier card.
> 
> [...]
> 
> > +	vreg_disp_3p3: regulator-disp-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vreg_disp_3p3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&lcd_bias_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +};
> 
> Stray \n above

we will handle this
 
> Otherwise looks good
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


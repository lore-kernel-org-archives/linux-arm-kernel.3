Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81C3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwf/mZRtI46sMzZDG/sWBBNgqE8Yi4L/CkZBvcmd/qM=; b=RxVhYmXAXCfniED+iflW/gEjCq
	AIAqgnKDN8UXQHyScwscDed7hgC8W0ljC/yAYPLlu2XEbxjrMeMGbz9/l2HoofQRKy7eUnmiEtf0x
	hgJYp8swFrUXyMWAo4okXYkB0JgF55IeKu8ENLcZRBjaMdoLcV/JMIdp6tM+p+II8nCdZiEKoN+Hg
	qId2NkB3hhcDcQLysONAQSy5bvU8yyHVoITYz5NpIRPSDkOVO9i0NTaBax2keYxv6LeME+MG238TY
	KyzqbwnIo3VuFOA2pQaSPfrAbEq4kMyF7b8sUvOwkVqFmpa/vh+7wDQtF8SLi9LAX6Q0fH4YzlfPl
	v/t0FbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JHL-00000005JdR-0jNx;
	Mon, 28 Apr 2025 07:51:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9J4J-00000005Gkl-3jDN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FB37A49F29;
	Mon, 28 Apr 2025 07:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7E4C4CEE4;
	Mon, 28 Apr 2025 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825902;
	bh=VY0AB8rCEQdpSvuXBsJF3HV1v4GpXOc/HeARcm9R8IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHMg6fwuiMQoyjs1xDa0O+wQ6NA2F29HpWvQ+rDBG7djichKEyed0YX3ve7Nt2L2J
	 KFSytths7FrYqakYwd9BbKESNEuYINr/+Jt5CdPrNqOS3zVQeOGxqEi2x/8cejeNew
	 760y4OEJYkCMClqNxwrTaAfTqpIq2BMDxbcXRxEHoq1/MSQ+qAEMx0r9l0USKtarM+
	 gzeUrqvRSDvfalxBST1grFTU/ivq67Z82sYQyQIAsO8nWlxFC26zCvo2Fp/TMM5OpX
	 f7SDgwK/KsNhf6QX4xbAcXza6RU1umVM4wSfMgYnvqVoBtCu9mfSlxuvSie/gw44ek
	 41Y9chvlbyTww==
Date: Mon, 28 Apr 2025 09:38:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP v2 3/9] media: dt-bindings: Add qcom,sa8775p-camss
Message-ID: <20250428-imperial-manul-of-aurora-ba1755@kuoka>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-4-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427070135.884623-4-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_003823_987158_D1DB0D73 
X-CRM114-Status: GOOD (  13.42  )
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

On Sun, Apr 27, 2025 at 12:31:29PM GMT, Vikram Sharma wrote:
> Add bindings for qcom,sa8775p-camss to support the camera subsystem
> on SA8775P platform.

Describe the hardware, e.g. why this does not have supplies, why and how
this is different than all other camss.

> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,sa8775p-camss.yaml    | 352 ++++++++++++++++++
>  1 file changed, 352 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> 

With fixes in commit msg:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof



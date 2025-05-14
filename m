Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12970C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re6IWGcKSC2N/57IJFynSyZ4j7S1zDMbSCtAv2eqnY8=; b=o3CSWdCBbKzu9oXujMmO9tzHSK
	CaxpwLdbDGeW/R5LTRl24YAhNG17oyYQyN/qvZAuUQAI/+wXFFmWaYSmKlfeuqoqwF5c0ScfQijbz
	wm8ewf7ff8E0hjv6TlTLAxK8VHp9+/uBvUo0V1xgO9tvCUJUNCJ//DtI53f9Eh4BV0lQOA+IDJYfz
	8F39FLteYGgPf479E8sSx5dfdbvyicF+7HlkrpC+ncOhMqGOq7YwqQ0rSLjiLIMlSMgHpvRz5JRdn
	25ZOoEisJ8gFsmfiw4EIjxHXBOO1m5n0zUSBYd6qQUdkq/1nJDQxjAWZ5GS0AbGhA+weYtmI6fMQy
	ieahD0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIqX-0000000GJ75-1TiR;
	Wed, 14 May 2025 20:36:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFInm-0000000GIsT-2iOd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 20:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B89795C5DF9;
	Wed, 14 May 2025 20:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DD7C4CEE3;
	Wed, 14 May 2025 20:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747254845;
	bh=AgWdADdayZopmP9VMGnSFuTnzWeLgg/ptjyuunN8QJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0yMcsnxuyC75aDmpTJvEQYQdhY8MPSe1xylgWhKekSh7/xl0bUWZElGh5Het2mLv
	 OyKa4Ocluq+vHXNlWUAKIcjhVCcAWbJHbLugmKXCL3ayNrML20A19a5x6zPUXMlRtw
	 tz76RwpyOpGMj/gRfSLiJuCySDe6/E9tbTeDjcp9eVGhVeFbMtJngt9aesbmb5VHHb
	 gOHIvGvyfOjur401ROw0HWenBWglpbYYfn9f7Hof3Z5BE08LEULecWJ8ciljcOkOYR
	 SxjmNzXMPqWlQmxj3jGaBR3pNc55ck5pRj6OCM6BqzozxkLLAtiIzJcbDxr0zcByVX
	 +0bUOP4MCAflQ==
Date: Wed, 14 May 2025 15:34:03 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: nvmem: apple: Add T8112 compatible
Message-ID: <20250514203403.GA2989424-robh@kernel.org>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
 <20250510-nvmem-dt-v1-4-eccfa6e33f6a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510-nvmem-dt-v1-4-eccfa6e33f6a@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_133406_724319_D16F0496 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Sat, May 10, 2025 at 07:44:44AM +0000, Sven Peter wrote:
> The eFuse controller found in Apple's M2 is compatible to the one found
> in M1 SoCs
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  Documentation/devicetree/bindings/nvmem/apple,efuses.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>


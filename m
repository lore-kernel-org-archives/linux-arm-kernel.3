Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE08E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCUFAByP9cVuG9VB1K7M9sg63VdKSoihxlYcF6Tvg8I=; b=TRLYI5+1npzx72AJccMqqtwREw
	buvCOtKg79KjoaDEhiIFXEXl06VhXFTfczh5OC3ZSijiOlu9PfIPnQudvdcXEkQSDQNgEZ1QRh0Hb
	V1q2XOPQqGa1vsFG079Qpb1ssfn3TcXQMejC679mgfIuPUMaJ6gIQ7Vxq3jaUQW4E4j+tD0YNe5/U
	Clpa2YhhQoH8K38XuAW7MQRX8HQhwsjqUmswr7cWvjfjk2EUs6A/SHHTOhFmosE4fCFn5WmPOm91a
	UCY6jg2MGpUtlWN69+zGd9+Ti0kt3pFtOu7uEIik9lIeiQayOdBPqkDJPGVRKhYzhpSyT26cqYJ3U
	+BE1Wk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1iQ-00000003CUL-3ThU;
	Fri, 13 Dec 2024 09:12:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1hL-00000003CEs-0kTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49A37A40E0A;
	Fri, 13 Dec 2024 09:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5358EC4CED6;
	Fri, 13 Dec 2024 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081058;
	bh=G+cTnuuCPd8OUrWtJFXbPhKcg/vWEnCq2zPfc22GuSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAbwKM7Ql8JlHQtvaxCAEjlrWi6IlQRqnJA8CZ04DwQrSfcb10h5+6cjzhldotnRh
	 L2XSBgnBNZJUfO8crBg8MZlN8CfTvAifyk+GlvHyJiBZTVjivci1Qq01nMnxglh31v
	 zi2eIA2ZMTu2jG9TIvc1Ivn5fZM3DHGSFcpIq8o1+3NB7mQAtUoaY5nAKzecFcPCyO
	 J9jow5Rd3wWUjudv+BGCRohLkufEOp6fwOe3r/hPcHfEjlJ+YXmMmxWIju6dHjvMhR
	 Jw4Xke+387YftU3lGl/YoX2Xk+UUsw0Rkspn2qa5yOkvs2yO2Ogw/NNIThpLB0r9xj
	 +Wc8vdUS31j+A==
Date: Fri, 13 Dec 2024 10:10:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, tglx@linutronix.de, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	konradybcio@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH v3 1/6] dt-bindings: interrupt-controller: Refine
 size/interrupt-cell usage.
Message-ID: <k7jftzlih6ss4yaxrv7r4dudhcu43iyu2qvkl2thb5wiaszto7@evzmwfxxzzt6>
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
 <20241212155237.848336-3-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212155237.848336-3-kevin_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011059_279453_74914455 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, Dec 12, 2024 at 11:52:31PM +0800, Kevin Chen wrote:
> 1. Because size-cells is no need to use 2, modify to 1 for use.
> 2. Add minItems to 1 for interrupts for intc1.
> 3. Add 1 interrupt of intc1 example into yaml file.
> 4. Add intc1 sub-module of uart12 as example using the intc0 and intc1.
> ---
>  .../aspeed,ast2700-intc.yaml                  | 60 +++++++++++++++----
>  1 file changed, 47 insertions(+), 13 deletions(-)
> 

As with all your patches, repeating since v1 the same comment, so one
more last time:

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof



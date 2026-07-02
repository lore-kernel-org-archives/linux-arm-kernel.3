Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1342C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kj18O54fK1pbDk2eoxrRJzyCFomk/x4UshRjF1lmSjI=; b=RuxbfANkpTNkB32BTas//3EcbM
	g9Dce6vnq9svPvxSRRcFVx5/tfmymN4gTimzDDktFxz/7k/zRfH2PyV2uVAECuCsStWToa/lOOe4k
	C3DP2E4Ssaju/+uwbPxDfdY4LMPpNU0uEEQoFwM0vnq8p0ZiJklxyolzYdY9WBELG1c+kgGfQcvl4
	j1PDAK4q+pY7PrMjnk2FM0jo3Eej8BhVQFoD2ndaIkH0gacrdi+VbOjU1QclRKeRUrZ6STvDQ1nEF
	TXPOrfSJITd+IHQR8qXjGx2oEX0YrAabVshcLpzBu/HGHjmTdZ9nUBewnzkOmimD9udcDR8ci52Te
	+UA0h5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNBy-00000005N0U-2bmD;
	Thu, 02 Jul 2026 19:35:22 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNBv-00000005N00-3M87
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:35:21 +0000
Received: by chaosmail.tech (Postfix) id C7EB21C888A;
	Thu, 02 Jul 2026 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783020916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj18O54fK1pbDk2eoxrRJzyCFomk/x4UshRjF1lmSjI=;
	b=TliEX+k5ea3vKtsVz0nJMU/ZYYQuehaNekOASgLfittsbS+fidYCkYblpCH5eQa9+hvMki
	t5EFWBF+dIIqls2s8jeCCzcOl9GzYdGttmSyrDyY7LSzqMShJnemV1wrzPC/loe9WcvhG2
	rMs3IrWYjRAVmw7Fq7AEYQVlxbPxUE0=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260702-kitchen-census-d79e1abb9f36@spud>
Date: Thu, 2 Jul 2026 21:35:05 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3B16D291-0C5D-489A-B8F7-60ECCB85141E@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
 <20260702-kitchen-census-d79e1abb9f36@spud>
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_123520_327238_DC85C7EB 
X-CRM114-Status: GOOD (  10.10  )
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

On Jul 2, 2026, at 21:18, Conor Dooley <conor@kernel.org> wrote:
> Are t6000 and t6020 the "certain Apple SoCs"? I assume so. The bit about
> "existing SoCs" is confusing in a binding (although it would be ok in the
> commit message), because you run into language semantics that imply that
> this sentence is about devices to the ones you're addressing here. I
> think you can just do s/. On existing SoCs//. And add an s to the final
> "state" to make it "states".

t600{0,1,2}, t602{0,1,2}, t603{1,2,4} (no upstream DT for those yet)
It is kind of a long list, with most t6xxx ones on it.

> "dcs" means memory controller then?

It is memory controller related, unclear if this covers the entire
controller or a subset of it. The name comes from Apple device trees
and macos kernel logs



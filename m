Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCFCC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6S6pzN/r5a4ugmR332ckbGF/8T37R8VCHGDICYO4+0=; b=YBe2kfXZhyKPisD86aDCzLkM6b
	VQ6J8Lvq5z9DGm8N7Gq6m0LEuYalSzafwMoSit3OMHx2KbF5/68dGoCj4sbKZicjj28ybAjV/6FDq
	UiFLqn1Lvyv0qDb5Yxd309PHpnuJz5bE8qeFN0ISKhJ6PmtbMgekXdLWKT1fUAV+pGSatXx5xLwzR
	GQbECZEj42xXHW+Mvv9fJHcNWUnHJMx+JOsxrZY/TJdC3GL+/bjoAYFThVHd6Z4HFmXNzMX5xhU6a
	+ANdLDGoz4Xt3D8hfWn7Ur2F8y948ni2yY7pC7apH0SC2doM1eyiDypqr0R/efuQKWLLvlqeRwbxn
	7nCYHzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEFg-00000007SHo-2aF1;
	Tue, 18 Aug 2026 07:28:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEFe-00000007SHb-1xj0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 07:28:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFB4A4365B;
	Tue, 18 Aug 2026 07:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9998C1F000E9;
	Tue, 18 Aug 2026 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787038129;
	bh=j6S6pzN/r5a4ugmR332ckbGF/8T37R8VCHGDICYO4+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ohR/R9IB4KTGx7cONhyKqVxZoE2oNBAeJpnNfzN+7Ko6+5Ov7dG8OTg3bmQPsYmen
	 4QYxsQ9XZY3ss3+hKXTA42hzdnIV1le+dYC992kHD4+0XqAc9P9AAiXVUxhefB1Y5a
	 bS1u9CeeWJttlOzU1qmFfKcsHB68c2ToQOxXlLC7ljKogI3dL6XMM4BdCdPkdihlbf
	 N7ht+LYJNZAL1hsVrjyIcPAl00+fzRgnhL2L1yOA+5Scg2VEa9YZ8Gvq08SgIF4Iys
	 YQCOZIXBXX9MBbzGGZtDvZxKi6HKghAreQUzzke50P/FDwEGxaNnlitCiu6s1Kd2F7
	 AzvKYF0yKMgBQ==
Date: Tue, 18 Aug 2026 09:28:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260818-hysterical-quail-of-youth-44d7c1@quoll>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
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

On Sun, Aug 16, 2026 at 12:26:21PM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
> 
> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.

Should be required for the new devices and disallowed for all others, if
it is not present there - both in allOf:if:then: blocks after
"required:".

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B01CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXWwLO4f27zLzjYaywvcUXu0PszcUzOkRGtDDmJg/mY=; b=Chmea6gy+WJmZSoa9JYAIVDKUv
	0zMb122ejWDzE48JnIZWhdrXkLBgznOYXRN/sMwggPXLJ4MkC68JkpDIlmW3pS8nD6TjzQovkh8SP
	RTU3FkjzAvt+n1t9Z+g4uTaCwDgAc5FF+A98SQOEx1uYcccz3G2H+YUIk0OVMSuskwhWWSJoBbbjV
	oR9UX4Bu4TF3pJ0xn+J0s4Ft4Z3PX5M16rTf5avQA3uQpsy/r/pkrnxwMzq+8O8znYPEk4gippKo7
	XAS3tVMJVvdOpR1tqWw6ls85OmRlgwU1eCKNiGLjOtrHY4yHgxbAu9GTOE3A5Bb2tT1UoH7gS2JEZ
	YNWhiLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYsj-0000000CR3X-3q0q;
	Tue, 13 Oct 2026 09:33:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYsi-0000000CR3N-2sQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:33:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4B7A60A7F;
	Tue, 13 Oct 2026 09:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64D11F000FF;
	Tue, 13 Oct 2026 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791883991;
	bh=eXWwLO4f27zLzjYaywvcUXu0PszcUzOkRGtDDmJg/mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpGJpECmnc5GxGubaFlWpDQl4qaGSZ2UveCm+TNNzJZWXRKayz4Rmf+L2QFacrirh
	 YnR8BFP6LodCdz8smZSQYduJjU2p3dbVcw9LuZFURwfnaUAGYaSWTXrXBCXQmVzviX
	 lIWY45DPbKXmvNrAQvS9BrnJgWNJW7bszssvjnI2eCf1Chsd3g6vMQ0aaJV7np+N9C
	 OQoM2vAXUqL/nhb5fV6ybacrvnn+ds/EL2B4kT08NC4mHHmMCLPosZxU0tngS06mkM
	 J5PIvAcNMD4TnkFlXk2foyPEl0VdDGAWrMQ3qW/Pyh5rdAYalfuZOI8VyMGAe+0jZ1
	 xlvI0HnD5+iWw==
Date: Tue, 13 Oct 2026 11:33:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and
 JNCRP boards
Message-ID: <20261013-sincere-lemur-of-unity-ede6a7@quoll>
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <0b8fbf07323894a48a777ea531713a0285e319d4.1791825961.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b8fbf07323894a48a777ea531713a0285e319d4.1791825961.git.dawid.glazik@linux.intel.com>
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

On Mon, Oct 12, 2026 at 07:39:05PM +0200, Dawid Glazik wrote:
> Add compatible strings for the Intel AVCRP and JNCRP BMC boards.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> v2:
>  - Squash the separate AVCRP and JNCRP commits from v1 into a single
>    commit, since the changes are small and closely related
>  - Fix compatible string ordering so the new entries stay in
>    alphabetical order within the enum
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



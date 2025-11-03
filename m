Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17A3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YttH/MWijqYNIN+4XFsD6guemcaJCqtbj/OjCzWnoM=; b=QiTfIt/eIoW/WwBb6/FOu0Msy9
	O1QbR4yx6GjZUHcE+5E72WbvP7CoHWvvKFk1s3/L7FxnxndW+zZbDdb3WQmGnJ8Fuqh+OSpVmRXTN
	d1xIL5Qe8MjH7dEmvZ8iioqG+GY0E+qIsfI9dOxZYEbMdGkNwAVezDDPV3xQlrmKo1KLxbUErO68J
	f7rk62K3wQ/moQW1uUv/DBzIh0qImTcx8jifo1MIyQEFTKtAfdaLFnP1EMPpOUD49OSv1rs809Npv
	Wu51Ve55auDYyV0T7JCp2IvQjRMM3ycomnYUOWbSX0XXmBLQr9LPQS9HgKOtN3m9QJLbcbrto2Kon
	o8VibGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFr4L-00000009Ws1-1jga;
	Mon, 03 Nov 2025 09:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFr4J-00000009Wru-2NQB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0374260007;
	Mon,  3 Nov 2025 09:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28452C4CEE7;
	Mon,  3 Nov 2025 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762162902;
	bh=8gK5j7Hv3paRWGmWznTyKoeIXmyc+VmCy3aM/L3TTSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mN+kLgdN/IlFgRwDuxyePznZM9KxTK4XQxaS7KEnQUWbLGJDBLYHYQcWjZicvIXwT
	 MrAQ1Xtj/qvXNDRqIZ2WSvasOL/rcevsH73NgmCEJrcCG0WflgNX4n3G9duyJ9huv6
	 OjnPYEjd52FLmf62HUYuhp3ss5EDEaXORmSQq1fa5kOMkVoSA0k1+LZ3+Jp9aNRDsO
	 fSjG57EhkEW2wCG54zGxNcjhf2le/DRUc0w7evopDQjRy9i4gVNla5yBIStGbndJ+H
	 eLe6sduFPAwDxfkw9XdhhDEoQCn4EZxA07EH39rBXlF5QUISp+LYmrTzWYV8sZGvGg
	 d+rUtEOvIVy6Q==
Date: Mon, 3 Nov 2025 10:41:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org>
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

On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> 
> If present these registers need to be initialised 


... for what exactly? What would happen if this was not initialized?
What is the exact justification for ABI break - wasn't this working
before? Or new feature will not work (thus no ABI break allowed)?

You need to provide rationale and "driver needs to do something" is not
enough, because everything could be justified that way.

> in the clock driver.
> Update the bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
> 
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for auto clock mode.

Best regards,
Krzysztof



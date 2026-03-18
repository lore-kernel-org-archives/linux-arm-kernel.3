Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35E2FCD0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWTalm5L4qK3n6kpEPMidK3UWL8xO33192fTwTnUavs=; b=RSbg8QrVtRuH9LE/6Q5d+od639
	X9YEaMxQiftEYANL6ExI7AKFhHYUsKXl9lE9HxGRM/yDk3EORsyxMmYRGce+Ftfkd3DLeZ58h04G9
	dJz18Gi3I3AjKFRUyHn5k6Regvrr5gNWRx3fSKRzS0E9jDC/I8wq/xL3AA4Wgcqq3cGh/j9QbVA+D
	L0toDcFEu7OglXV7LRwOmN2/LdJrkmbSkWgPvsqcpSb3uXIQztwlMpMcmtKHjs0QTVQlnFu4wHjK8
	9Wm+rIeREJdsLV5SzV9ov3nR7oXeALsUomvtVcaRHgPZaN7tpMxEonfYxwixt/k1HMJFAY/jgBZn1
	LDLFaS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lq1-00000007yMN-4B6N;
	Wed, 18 Mar 2026 08:01:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lq0-00000007yLq-2WhX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30DEA61118;
	Wed, 18 Mar 2026 08:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562BDC19421;
	Wed, 18 Mar 2026 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773820836;
	bh=JcYUVdQClTfAto/aY5CwUWdQ3GX10YbnZOm9buLexog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRtrdj17e5PnFocx4e8uTwccB5PYZJnN2Hrghz3EhlFXphiSE/gk5h8yheDrnkFcm
	 0GqXxk6uQR3SFM64fo3FLs8iHz0ytpD5c4h/q/ZnqQSKfc/yIgLmxU247AHQYaIrdc
	 CItWLx0eWaXIXqLFLbeDMOEDfiZERZQOUMeOzAPy/OsKk5eqw/ckKtqMYEZkn7SRxL
	 VzW/ptiOE2mJ3hLr1Ohm2vYgyq/h6B+gZST1VqooMasZa1TxQwdIwfz6cl0yg5pvKC
	 oji6EO1jNayiZGfCfuKVTX+q2FIoSOAOdp5B/XV5jJArW5tSLtzrc1zBJ6TzNipcge
	 gZ9qDWeSJ4iwg==
Date: Wed, 18 Mar 2026 09:00:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 0/8] Arm Live Firmware Activation (LFA) support
Message-ID: <20260318-courageous-omniscient-fulmar-23abc4@quoll>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-1-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 11:33:26AM +0100, Andre Przywara wrote:
> Changelog v1 .. v2:
> - restrict build to arm64 (the LFA spec only supports AArch64)
> - rename and extend central data structure to fw_image
> - use separate GPR register sets for some SMC calls
> - provide wrapper for error messages to prevent out-of-bound access
> - return GUID in the "name" sysfs file when image is unknown
> - fix wrong attribute in pending version number show function
> - add missing include files and order them properly
> - fix memory leaks in error cleanup paths
> - handle lifetime using embedded kobjects and a kset
> - drop global lfa_lock, use kset list lock and kobject refcount instead
> - add DT binding documentation
> - add timeout and watchdog re-arming (contributed by Veda)
> - relax timeout period and do not block while waiting
> - register ACPI notification (contributed by Veda) and DT interrupt 
> - refactor ACPI notification code to allow sharing with DT code
> - use faux device instead of platform driver
> - add auto_activate file to control automatic activation
> - introduce rwsem mutex to prevent using stale sequence ID
> - use labels and goto instead of infinite loop when retrying activation
> - initialise workqueue only once (thanks to Nirmoy)
> - various cleanups on reported messages and code formatting
> - rebase on top of v7.0-rc1
> 
> Changelog RFC .. v1:

Please start using b4 for developing patches. RFC is v1. RFCv2 is v2.
Whatever next is always + 1. Otherwise please share how v1 and RFC can be
easily compared with b4 diff...

> - Updated SMCCC version 1.1 to 1.2 per the LFA specification requirement.
> - Changed "image_props" array to a linked list to support the dynamic

Best regards,
Krzysztof



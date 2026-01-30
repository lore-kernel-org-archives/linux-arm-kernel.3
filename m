Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273BE6BF06
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LC1ZbbLbxb9+FBbghA5VC66mQ7sXKTWvnnOzLCfBr8=; b=NaiGuiTTwMfC3sx2uSpNTQkFv3
	KfYhOXRo0g1efs5eCVdb9hWsuj0tzKZ8TN+5TbH4160wzWgk3jzt891NzVe5b0pCAukghMzmXh5xo
	zTM3R4MD0nWJwk34MFNDXuRQ/lLMQ3dAeZp7JUbH4JSHRIAb248Un8sUg4qbznuGd6zUAHCWthTkw
	VRRwDuqDRTFczw4vU5fBPH4KkGoLPdldbDiqIqTLmlc9AflLbjD90zPWi4/ps/ojym8Pk6caCp/qm
	NPKwVY6HVJqBtaQt6BKlMXTYH1it44CiKVUAldbVpFz9lZxRPnjdVA6hKcJ5AtPLnPBzvBnpOBy0t
	Lyn71W7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnht-00000001TzJ-2aIA;
	Fri, 30 Jan 2026 12:34:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnhs-00000001Tz8-3elZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 12:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA9FC60125;
	Fri, 30 Jan 2026 12:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E8AC4CEF7;
	Fri, 30 Jan 2026 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769776475;
	bh=zhVwVdb/153KmPoTgYqysHOn0kSacT4DH88UcwPi72Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tB71njkAEoAfkFfrk/EJCshWcIMXd5T4Sx5tSymI3q9kgfKSgdm6qUDexoCC5Yhjs
	 1dbAjAGWYrKgN59LWVkNor2zWJMhIHiCJ+JKxlfoBFkdoE0ggc3uGFHLbeOjPbEmrU
	 2NGFKgxm7rCqCbQ0jWrdoySmD1UtCWMpJsH+n1Y/F4ofIzHISTMbHvUjC4tgx3h+Vs
	 qkQbqQQcYa2gJNPYkZGMt9LuTYlrFjoA6pqjGOhcUF4X8QIWv1VbeddszC/kgduxk+
	 LX5GQl09WdBABxP9v/+CRwO7J2sFgdaKqMqI1g2jW0LcMB0pnfceHOHLD+3LuG4dGX
	 Lmn3Ya2ZihGTA==
Date: Fri, 30 Jan 2026 12:34:31 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Debbie Horsfall <debbie.horsfall@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <20260130-light-piquant-termite-fcbec4@sudeepholla>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
 <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
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


+Cristian(in case I am talking no sense)

On Fri, Jan 30, 2026 at 11:31:25AM +0100, Andre Przywara wrote:
> 
> So do you need just one "tx", but "rx" plus "rx_reply"? Which isn't valid in
> the current binding?
> If that's the case, then we would need a patch to relax the binding and
> allowing this combination as well.
> Looking into the kernel code it looks like the SCMI driver doesn't use
> mbox-names, but explicitly expects assignments depending on the number of
> mboxes? Somewhat confusing ...
> 

It is generally transmitted via tx, and tx_reply is necessary when the
platform has unidirectional channels. tx_reply is used to determine when the
synchronization commands have completed, without requiring polling of the
shared memory. rx_reply is necessary only if the platform firmware expects
it and doesn't poll the shared memory for OSPM/agent acknowledgement.

-- 
Regards,
Sudeep


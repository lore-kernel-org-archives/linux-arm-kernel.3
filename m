Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898DFC9EE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uky5dYDRK/oGOWC107IziUY1FxAoeOlYTj45ZwD8joE=; b=2WXVkyx9oJN9JjmCSkTKpEYl4G
	Mr7a4Yy9y+iF1fLZOD894y3wC/IBIwrZ93tjOO9Rpo/D5qVCXft0yjCUGdZdtmqbtbnrkuYy+HI7y
	n5ywKGEZ6gLus1AKycuT0kA+EBoXgldGtVjIyO8dwp+Jh1r73vt5MSZmcGMoXaqSMHEVeoGP49O4y
	fhsRLxgrdM+6itDrU2uCiCzVcAq+4nmiyddwTotKgj1DktDrUb83aVmNBa1AmeKD08u55zO5S3UQB
	/ao9wQCXELFG6W9X7zdQNhxsS4jU3RUp9zbqrzXJsmL5X3eULc0veFLMVYzZ8XkrCC9RPkEq+zMUr
	Q/M/E8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyote-000000055sh-08Hl;
	Sat, 07 Mar 2026 10:28:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyotc-000000055sY-3r3c;
	Sat, 07 Mar 2026 10:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C9F460053;
	Sat,  7 Mar 2026 10:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF26C19422;
	Sat,  7 Mar 2026 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772879311;
	bh=aL7xWU2QFVQcszBZ0W6WzvMqzl2GSm9ttovms5QsrHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uC54ZokK0oi4qdp5kBriDIZmn+01uJywrf38JJure2NLqyIaXDrb926rMFwO+CxpL
	 CdNVnDzWiA61aqVLf/eiQEG9g887D/6zJFbEr8aZuN0ENsVXocGUiUocCoD6ue9w5H
	 pFmpdTguSu5Ldt2bMs03kXnj3MqD0XTSxFrZLPVne0lUSqW7tQKkJcB4q12xsCsyHG
	 YRI9lG4a0x2M7YOLJacLGldEcvQJ2YVvRtP48kPzWaFN7qQMJWIbdMSAMYM3KptkZg
	 uXmb5xruv7cU5uYhSNxsOm0N05EpgvyQsVhqN3NuVUuteNEQA8Cg8cJ2C1KApnNhjv
	 3xYAW1RC4M/+g==
Date: Sat, 7 Mar 2026 11:28:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] airoha: an7581: USB support
Message-ID: <20260307-poetic-salmon-of-order-33a4d0@quoll>
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306190156.22297-1-ansuelsmth@gmail.com>
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

On Fri, Mar 06, 2026 at 08:01:49PM +0100, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
> 
> Also other unrelated patch are dropped from this series.
> 
> Changes v6:
> - Fix kernel test robot (sparse warning)
> 
> Changes v5:
> - Add Ack and Review tag from Connor
> - Implement Ethernet support in the USB driver
>   (testing support for this Serdes on a special reference board)
> - Use an7581 prefix for USB PHY driver
>   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
> 
> Changes v4:
> - Rename PCIe and USB PHY to AN7581
> - Drop airoha,scu (handled directly in driver)
> - Drop dt-bindings for monitor clock in favor of raw values
> - Better describe the usage of airoha,usb3-serdes
> - Simplify values of dt-bindings SSR SERDES
>   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Why is this the same link as v5?

> 
> Changes v3:
> - Drop clk changes
> - Drop SSR driver
> - Rename property in Documentation
> - Simplify PHY handling
> - Move SSR handling inside the PHY driver
>   Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Best regards,
Krzysztof



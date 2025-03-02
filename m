Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691DDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41Urw9pUS3IkmTIPuFqUDyIbxUtgIUEIRMkgs9tsTLw=; b=ZfCpc1NpxZM5X7PQJVeOSJedsG
	UDEm5/4etjWN1FS5Kzj9hdNXmAjPLzO5GqQWF3HDkdqxKdHl8moB69xX+DgpgKCFKY5HNI2h34ET3
	XKpcdQTexlV90u+Djf2ah+PvpXy7KRyp4qS3ungZBvAXwMtIcgws5LtVQMeJC+a4kDTI2t5HsAZ8a
	RTaX46CU4uOPhbQ/Z/4k7JDljHwFlItBEJONcokM44YdSl1RW6H97/kEU1qJfUaTEM/K2tDdr9/d8
	N2lBYtCCK4CPqBufeHypTTTj9YN+wmsBfvy/p7d0zYUZy44T4t63xk164oW/fmrr1Rupt2+qNhwal
	Y0qFBFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ton0M-0000000GQVV-1TpS;
	Sun, 02 Mar 2025 17:21:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomym-0000000GQLZ-2kEf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 17:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=41Urw9pUS3IkmTIPuFqUDyIbxUtgIUEIRMkgs9tsTLw=; b=LzOvHwN66Ik5fv+w2t06injFiY
	YnZ7FHFsu59lHmZLKCvLkcctp2IUR0KNjkAdFAkvTNZCPjf/c7IYZsKVIyum/p4cX1ILzZU5GuwZU
	VXpiiAnLFveSWPBVTgDxYJHOFDXA0HmHI8FPU35tID0MBZQFz+U+tSmT0kJHCb2TOhxgqxshZ0vl5
	CWrVkqWwloCR2ZstuziJXR4hpHrSely7AiMtoXLuWjEUxOLVZiO10d29xWzzKzzIT70LUGnPcQZqa
	9Cwa9Uk8S7Cq/X84pbEfJ0i8Roq8/2HaVUI0Slg7NTYGoFG6jN4dbn7+KSQQgniAwoDqFcmAQpheC
	JsTriIpQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60310)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tomwi-0006rb-2U;
	Sun, 02 Mar 2025 17:17:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tomwg-0002vQ-2a;
	Sun, 02 Mar 2025 17:17:42 +0000
Date: Sun, 2 Mar 2025 17:17:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: phil995511 <phil995511@proton.me>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paulmck@kernel.org" <paulmck@kernel.org>
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <Z8SSthQ-gK686k8u@shell.armlinux.org.uk>
References: <0oXU8PP2CHCw1Qblhw1cKOTt90K2CLbHo4BLw9LOs-J1klN1Y_N7IagulWZHR7bGhmxyPXlZTOUEqVZDtwcXj9j93_BxdrdnmW7qk3uIrU4=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0oXU8PP2CHCw1Qblhw1cKOTt90K2CLbHo4BLw9LOs-J1klN1Y_N7IagulWZHR7bGhmxyPXlZTOUEqVZDtwcXj9j93_BxdrdnmW7qk3uIrU4=@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_091952_692783_DB57A14A 
X-CRM114-Status: GOOD (  11.59  )
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

On Sun, Mar 02, 2025 at 03:23:20PM +0000, phil995511 wrote:
> It is a very bad idea to want to code the Linux kernel for ARM in C++ !!!
> 
> Our ARM CPUs on RPi and others are not powerful enough to use a Linux kernel written in C++ and therefore lose performance, while these ARM CPUs are already extremely low-performance !!!
> 
> Suggesting to code like this is to be in favor of planned obsolescence, of the scrapping of thousands of small machines ;-(

With all due respect, you have your knickers in a twist.

This is not about C++, it's about plain old fashioned C, which has been
the preferred kernel programming language for decades. I have no idea
where you've got the idea that LinusW's commit has anything to do with
C++.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


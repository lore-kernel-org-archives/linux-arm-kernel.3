Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83951C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tEv4/48JjEv3JWIfkpqi+0pjDBOd/eJ1dtGGC2UOQgY=; b=w7GxlIAIkEBKLYeVWNm8nZSM45
	OcZLCwrDcYdN+fgtjItAwjxsvk++1eyv16tiX0CZzSQ35aSiej2mgQyItkU8hqO87sF/GLtf2EcMz
	xB9Gw6TOvXKENmoRyZVA2W8ZECYbixVCxY7mTzYeroLdt+qWYTXll8l5Mk/MF9+JzJKirYCbWtGY/
	Zjb7DP3mDHI7djiUmKJc9y0gzQbRX9yf6GvywVOytVMo+gFc1QYdQ0uORoOhoWS5X6zGr3PYf25ps
	KExnLNouSF3hBWuJb1ekyJb7f7TCKcqnzcy1bsz8vdghQrviRA6I+UGOuiptUBXJxAwNeDtLCKGEw
	3RJA+jDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolBt-0000000GDmZ-36ve;
	Sun, 02 Mar 2025 15:25:17 +0000
Received: from mail-10699.protonmail.ch ([79.135.106.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolAJ-0000000GDiI-1q7k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 15:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740929007; x=1741188207;
	bh=tEv4/48JjEv3JWIfkpqi+0pjDBOd/eJ1dtGGC2UOQgY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=cekcKOiZFnN0eQFPQVefT2fzEMjeSMuExRacNg/rjUKSISjUiH3BdhnAWfZN399Ck
	 WslfR46TO30cqK8O7dPHEHUJ27J8xhIf0HdYsm0rSHpuKpbqZJRyVEt5782PFxEsbM
	 P5pi90+hoKIjLsG4OkI7Wt+nx12bV9cUMlBh/NFG3HXvbtWZpZJ29eUVZoQbjwB6Gn
	 shnEMECyxJ2ODHv3+VxWZmhxgtH7CkQI9QmUTU3Wby9J5ewUoiSPQpr34L2KJnJ0Rr
	 n9RzI7pvxO1HpA2jB+NYiUmEjdkIZEshC0r+2D7cAU/2JyrvCZY/o4yNO1zZbvOL2N
	 C1Iq59OZ+8Zjw==
Date: Sun, 02 Mar 2025 15:23:20 +0000
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>
From: phil995511 <phil995511@proton.me>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "paulmck@kernel.org" <paulmck@kernel.org>
Subject: [GIT PULL] Generic entry for ARM
Message-ID: <0oXU8PP2CHCw1Qblhw1cKOTt90K2CLbHo4BLw9LOs-J1klN1Y_N7IagulWZHR7bGhmxyPXlZTOUEqVZDtwcXj9j93_BxdrdnmW7qk3uIrU4=@proton.me>
Feedback-ID: 128908939:user:proton
X-Pm-Message-ID: fd884b771593dbe59e5596e7e95d08bbfa8fd04f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_072340_214982_63D2EACB 
X-CRM114-Status: UNSURE (   3.36  )
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

It is a very bad idea to want to code the Linux kernel for ARM in C++ !!!

Our ARM CPUs on RPi and others are not powerful enough to use a Linux kerne=
l written in C++ and therefore lose performance, while these ARM CPUs are a=
lready extremely low-performance !!!

Suggesting to code like this is to be in favor of planned obsolescence, of =
the scrapping of thousands of small machines ;-(

Regards.

https://lore.kernel.org/lkml/CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_+=
+cZ_A@mail.gmail.com/

Envoy=C3=A9 avec la messagerie s=C3=A9curis=C3=A9e Proton Mail.





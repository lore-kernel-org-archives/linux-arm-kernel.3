Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD26C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GY9oAspc/UtzxBw+Itn8O6EjWFnF2C8yVESOjSlnrI=; b=SOUuKmpha2p9IQv1iZcOeAmWIR
	Lg0liE7leSWJPavoxodq3QDhDYuG9msHNGyvs0t9z58tNt3Wi963vrS56kQH7aP/NDRyxnSAwTE3H
	7MpvnffWbr9VwDmMtzhrO4+dST/jc+2hvejGcjgYQLj7fk7yRFXvA28/wx8z7J3N7tPML1prvo3xR
	HTPGYp0iSctJNEcmAgeKB5RJKxUTWIEuqbEV64j9l4faGxGjvB/IFUcT3ptRE7OZnXA+ERzs3PigM
	qSkGIvkFE/VihvxcPpsRJAbW0QkuPRE2UnL4LR3rOmM4uewefwItHYTeR0zZRUPEFoM83hlAafAeY
	IXqkM4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8uo-0000000DJtu-3sFb;
	Fri, 28 Mar 2025 12:34:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8sX-0000000DJY8-0bw6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8GY9oAspc/UtzxBw+Itn8O6EjWFnF2C8yVESOjSlnrI=; b=IKbiqcmatIo0Xkt4D1J2y/GG+t
	ZbuNUAw5UdJFOliKlRY/+WuQbfhczTWO4mSRBVwMYz60TS7L2hS+imkBaQ2NDPLyt3Szyt0MnkBzc
	uW0hOCRc3c0B/DdgEAXxuoiJUbgFeMNtMspS1EYeOY73CiY5ubhx07G/L3DirVQvy70hDUgIZdNfy
	Ir54uMqedYZwpd1qlYPAZcjcDamI07VZAcc/RfZ4RfEuzGv7/QHsNgVy3KKLINbx6SVxXmWU3+wU9
	kmalwafojs6If181kkuxPEe8DczboPeh+leY/fepp7AdB62+Yt8BNhMkOWqk/U65yate1OaInct0A
	5E0yfIEg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49770)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ty8qR-0008OX-0q;
	Fri, 28 Mar 2025 12:29:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ty8qM-0007BV-0X;
	Fri, 28 Mar 2025 12:29:50 +0000
Date: Fri, 28 Mar 2025 12:29:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yeking@red54.com
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Nathan Chancellor <nathan@kernel.org>,
	Victor Boivie <victor.boivie@sonyericsson.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Oskar Andero <oskar.andero@sonyericsson.com>,
	Bjorn Andersson <bjorn.andersson@sonyericsson.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
References: <tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_053205_183858_931AEB24 
X-CRM114-Status: GOOD (  10.40  )
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

On Fri, Mar 28, 2025 at 10:20:17AM +0000, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> 
> It should be the default command line appended to the bootloader command
> line, not the bootloader command line appended to the default command
> line.

Later arguments override earlier arguments. Any compiled-in command line
needs to be overridable by user supplied input from the boot loader. The
current behaviour is correct.

Sorry, but no.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


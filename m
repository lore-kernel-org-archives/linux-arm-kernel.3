Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9F0C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lryDCpxFt+jlR1Yqmf+dLIaEjF0R9KXXz2DDNZQ5zYM=; b=UpJXkCscQcANySzX65025eZUkh
	9imy/Mz4w9NVsyKOyf4I8JEGDkDNE14fRTXgcDc8giB3Qhvw2PK0x5MCrOcA8XK3UusMljEivGlNE
	RL3nncadMvlSyQbW9uXRR31KBwi7Ezdb6wPd2YJOOa6S7+6KuRwg8fRzgg28QrCR/P+EybamtYYKi
	EBQ6CPdCI71tcnsRBZoj9YKQ1ANBzS5rSCrr4VXT2NPPg4GKCrVFadAZb6Qdb+wI+pvYuluoE+jDk
	PewXYD2Cm+4mzEFc9ObIr8usWO1KClZuKKEhX+H2gSSSe/8ZPpO9lJC2/fuUO68PcXxydDwvTFia3
	bYUiecAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMipF-0000000CnVp-3vPN;
	Wed, 04 Jun 2025 07:46:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMin8-0000000CnKs-1UMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:44:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749023044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lryDCpxFt+jlR1Yqmf+dLIaEjF0R9KXXz2DDNZQ5zYM=;
	b=fyiT0v0JK6oTqwCg0TWPk1rhXkFYY+LsS3HY0+sLcHnZ414OpM6yIttBfLbxrqpc0HSW8Z
	SxzcsT6yNU+hWBrh0kGshX4bkmQvnJBOxZUkQAcJl8TReAn5x+iB0DkAM9vektU16ZnQsm
	X+/uBKWzZ3m8X6SgQxoVpoOUgtNvKpTFXG6Y8mjxamO6xvcw1nW4wOa9dRTn75huVulZGI
	16Uqp4dJCEDPg+z5wGSAXtdU/DxmMKQnUVQWe+Ued+STb+KfmMbT7lTKmkJ6svbWlNtZlJ
	iSThdMN+WtdxIwaWQLSdFuufT9oY+BVFoWg9TELSloc73ZNy1qz7ArJ9LmQR/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749023044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lryDCpxFt+jlR1Yqmf+dLIaEjF0R9KXXz2DDNZQ5zYM=;
	b=rzXxhYCzZcixFqbWBYMcUcQG0diMkiwQ+vuvpy5eB82H35PoovQCM0r/9KTlH6sCVQVWXn
	FdDihW0QdOLv1BDQ==
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Cc: 'Michael Kelley' <mhklinux@outlook.com>, "pmladek@suse.com"
 <pmladek@suse.com>, 'Ryo Takakura' <ryotkkr98@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <TY4PR01MB13777DAC71E234B9E58CC6C0DD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84sekh5cki.fsf@jogness.linutronix.de>
 <TY4PR01MB13777DAC71E234B9E58CC6C0DD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
Date: Wed, 04 Jun 2025 09:50:03 +0206
Message-ID: <84wm9sne7w.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_004406_536791_B881E0AA 
X-CRM114-Status: UNSURE (   8.23  )
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

On 2025-06-04, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
>> Unrelated to this particular report, I am looking at commit 2eb2608618ce
>> ("serial: amba-pl011: Implement nbcon console") and I do not think it
>> implements atomic printing correctly.
>> 
>> pl011_console_write_atomic() assumes uap->clk is disabled when it is
>> called. However, if it took over ownership from the printing kthread,
>> the uap->clk is already enabled. And then after printing its line it
>> disables uap->clk, even though the interrupted printing kthread expects
>> uap->clk to still be enabled once it regains ownership.
>
> I believe the Common Clock Framework manages the enable count for clocks.
> Specifically, uap->clk->core->enable_count is incremented by clk_enable
> and decremented by clk_disable.
> Wouldn't the clock remain enabled until enable_count reaches 0?

You are correct. I wasn't aware that the clock framework had a usage
counter to allow recursive calls. Sorry for the noise.

John


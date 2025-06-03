Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A03C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fmXLNY28v1hpCt9gnOZ3e1NvaAcrprXNPAeAIatdwY=; b=09immlQe78MYacIYS2z21/WU1+
	JM58thhL8nrN2HlIl6NZKc2GfT0OEtPbDmZKp1QX+lXYESPY2q+6C/GLwtqIeuXfUWOHZElDJYSIC
	g1NsDi0Ej6JmlEhm+jOBYXyLTrwXLtvQqXlsEILrWJbf7H7m8Oetc3Bsgi6AL2Gn0mAwHoDtxBcyy
	kbAt/bWHY111CJ92hLoCV3/xGrbIxbN6NvKsoDM6TvPxoNTUvW9OWsxbP8cAAFKKdHmDy89SzEY2L
	3GHEGMIsA7YQkpOasjPioGNJmZ/roS4421orEO8/BXqMbmYyJpFXi47JY0utS73s4x0GLGG5GBjV8
	fQyIIxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBR-0000000AhSE-2FNl;
	Tue, 03 Jun 2025 10:47:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOeG-0000000Aeqs-072A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 10:13:37 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748945613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fmXLNY28v1hpCt9gnOZ3e1NvaAcrprXNPAeAIatdwY=;
	b=L9wcuCocVvAROJB+Vm0OMYtp7fufY8dT/XSrg66W/wPnRPYVwXbuzvxw6y/I0bxWGZLl7k
	hhsYZ/WXTKhJcBS9P8EKndIyRzxkuIQ5eFMfUEWTNKAYq6xom2+K4mQx/Wo77fZEx6sr8+
	XOtD/Br06ez9QfpXwaQVqrvV0XLpFymmBMDTjPqFb0QNvuCbEUBr0cKhcMuwBcHjaBJTNM
	tOfbZCzQ5GIKH0JUeRQ25WViQOjsHG8rJ0HlJubM6ctKGLqwmAIqif7h8LoYDAs16AyeDN
	ai7LFH63uRhQXBclK7LDIn6QNMiEYLWsgRaqkKEp2jarZ+cAbJDinATxEB/Fdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748945613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fmXLNY28v1hpCt9gnOZ3e1NvaAcrprXNPAeAIatdwY=;
	b=WvtCDCkhUyXu1qXvp7/fcYjduzLtlT//gr4N95lbI4JHE7mq1qxMduaAOFDCksOFsOXHo9
	a39axwuqZMvMlJBg==
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>, 'Michael Kelley'
 <mhklinux@outlook.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, 'Ryo Takakura'
 <ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
Date: Tue, 03 Jun 2025 12:19:32 +0206
Message-ID: <84y0u95e0j.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_031336_208907_8F1D3DCB 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Toshiyuki,

On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
>> 4. pr_emerg() has a high logging level, and it effectively steals the console
>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon design.
>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
>> enters a busy "while" loop waiting to reclaim the console. It's doing this
>> busy "while" loop with interrupts disabled, and because of the panic,
>> it never succeeds. Whatever CPU is running "pr/ttyAMA0" is effectively
>> stuck at this point.
>> 
>> 5. Meanwhile panic() continues, calling panic_other_cpus_shutdown(). On
>> ARM64, other CPUs are stopped by sending them an IPI. Each CPU receives
>> the IPI and calls the PSCI function to stop itself. But the CPU running
>> "pr/ttyAMA0" is looping forever with interrupts disabled, so it never
>> processes the IPI and it never stops. ARM64 doesn't have a true NMI that
>> can override the looping with interrupts disabled, so there's no way to
>> stop that CPU.
>> 
>> 6. The failure to stop the "pr/ttyAMA0" CPU then causes downstream
>> problems, such as when loading and running a kdump kernel.

[...]

> After reproducing the issue, 
> I plan to try a workaround that forcibly terminates the nbcon_reacquire_nobuf
> loop in pl011_console_write_thread if other_cpu_in_panic is true.
> Please comment if you have any other ideas.

For panic, if it is OK to leave uap->clk enabled and not restore REG_CR,
then it should be fine to just return. But only for panic.

So something like:

	while (!nbcon_enter_unsafe(wctxt)) {
		if (other_cpu_in_panic())
			return;
		nbcon_reacquire_nobuf(wctxt);
	}

(And other_cpu_in_panic() will need to be made generally available.)

John Ogness


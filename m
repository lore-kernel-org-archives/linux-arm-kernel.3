Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CFDC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L7wMknOS2DR/OxphxVCxpmpvYnfo0hQIoILtTL7Lf4=; b=myKF0JYvl5ruzC6MIuUt+6niH7
	tnq10QpgrMMt3s+VNldWMteQlMFMP625CdyycGMaofXOa0wt2pUDZQLfLCRiBrLc+b3v0OJ3xfEH6
	Am4x1tUm/rgimtp+YlzbZEDGxnXa37poOx5bodrBHKOEgCSjy4M1cJCB/39JWtD+DBTXKwnmXaS4q
	HnNrdRl/PbJr8QPWAFSkoRTxW6r3TEpm9r6WcPNWYrCutE4aF3kyKkbRStFLz/bwU47KaOb+Dk8lf
	SE+HPY5ROkrvRwJCHDYod6+eFm7tVxp/usLWya5YH/1Ud/qFLqTREYCcNsdw/LrCpaICtXFkXTri1
	zmWSoKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7euk-0000000FUFK-1S9g;
	Fri, 18 Sep 2026 20:10:30 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eui-0000000FUEY-1tuo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 20:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=/L7wMknOS2DR/OxphxVCxpmpvYnfo0hQIoILtTL7Lf4=; b=HmW39Iir7+/vVQHv9dyNqoi38W
	WYZuZonbqD4r9T8Nh0WBS8p+ApdeZDd8ot3Mirn9qh+UBAT/7IXTyhRepWyQ1gCWOwUkaVH0vl2os
	2o78U7JCRBL9qBOPO5f2j7D4tD7tW/N5nNwe5loX+DAM6Ji946L1IYcqxlUE/4xibeJxhtrY+bXN8
	g3fnfaX4drfI1zXkiTnh9ZvMFgof2R/KMy+ZNunupVWs1T4SPZlNd1h3X6PuMirNITgMAhsrP3vVj
	RKbBhQU6ccsAx/jZjAsfH5aYxZCpbOieuw0jTD1bLG5I4kh9aeBzaup36xWi6VXzj4TXdqM9TlBSy
	VA3eTcHg==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x7euZ-0046tt-QT; Fri, 18 Sep 2026 22:10:19 +0200
Message-ID: <28a9bbf2-da18-4982-a89f-f8e8d1e2da36@igalia.com>
Date: Fri, 18 Sep 2026 17:10:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/13] arm: Use the common syscall table
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
 <20260917-tonyk-syscall_table-v7-4-f4cd8f8e3265@igalia.com>
 <4fa47186-08b3-4b2a-bbcc-16b14a50ee21@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <4fa47186-08b3-4b2a-bbcc-16b14a50ee21@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_131028_488812_FB5E4DA1 
X-CRM114-Status: GOOD (  12.61  )
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

Em 18/09/2026 03:22, Arnd Bergmann escreveu:
> On Fri, Sep 18, 2026, at 01:46, André Almeida wrote:
>> Remove some of the duplicated code by using the common syscall number
>> table.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> Changes from v6:
>> - Added back syscalls from 403 to 423 to local table. arm32 can't use the
>> common table for those syscalls, because arm doesn't implements compat_
>> entry points for syscalls like pselect6, ppoll, etc., and OABI uses compat_
>> entry points when it's available, so this would cause a build error.
> 
> That's too bad, especially if this is only needed for OABI, which
> nobody should be using any more. I had hoped we could kill off OABI
> soonish, but that is currently blocked on the discussion about keeping
> RiscPC alive.
> 
>
Right. If you don't mind, I will drop arm32 from this patch series for 
now, while we check what will fit better here.


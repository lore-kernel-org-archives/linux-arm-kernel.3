Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853D7CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQyM8PYqgq9KHO/9GDVJe/G8ctJp6ORTTOTa2vgtdPo=; b=h7SRb6u67VhtbhoszoekZQYp+j
	PzcWMxRf6tFFWMySJQR1LaDl2y+KRqoNYScK8n5hV8Y89O6lBfNb2VDG+3ypshITyS4VjPoy2NT+Q
	kNuZINxd8JGwcN6vD9EK61aY5/jrmQLRHggCYNFsOd8p4hoyFVCysSMDlomje4JYQn6DdfUF/3zg2
	t/w2mv9FGEQgu2+myhmwH7cnHH8SDliL4wPxb2q3Vuy8RcDHa0thrxthiwSe6mYyuoeDzq5wyKZdD
	g+BCoOeQ5Zu4DMsSrDXg5YJGWeCK+qIMmW3iLxwALswew5aP1fgZbevrXzmuydVm6WS6A633YOJBS
	8MhA12lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFvn-00000009ZS9-309O;
	Sat, 02 May 2026 19:23:15 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFvl-00000009ZRJ-0XFz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 19:23:14 +0000
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 410F6160524;
	Sat,  2 May 2026 19:23:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 3A49C20018;
	Sat,  2 May 2026 19:23:06 +0000 (UTC)
Date: Sat, 2 May 2026 15:23:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v19 0/7] ring-buffer: Making persistent ring buffers
 robust
Message-ID: <20260502152304.560a5954@robin>
In-Reply-To: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
References: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/bduRHcIgi7cE_At8/bu1uhd"
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 3A49C20018
X-Stat-Signature: 1p61ghnqdpke4wkizqjbgexfjuxxyhqw
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19GhuIyQaIfEX0jv4huB7H5ggusR9h7p+8=
X-HE-Tag: 1777749786-296731
X-HE-Meta: U2FsdGVkX19bUoGqhA2+ZC9WRj15X+DlVnMrZ9GL9LDsFXFqNWKrSedMwv9eDtwKQQY5jzSCeRN5ay+A/mpFH1V41iSgOsKuZmcRpJY7Q1nBf/36tTBCukt6pNL65VMzdFrjl5+rymlfb5aO289feVNy9DTZJ67ZHW7cyV5mcnZUkB8CGKYEXgb4hde5Qawtehde5AszOb8wuQLwbGCMLfEVkRz74Wn62mZ12x2rGFS0UvXqyy5Zk0iK1Ez6ahmDW53ok34uWPRJoAEBXdp453CMHj5SCFdAoBolaQjzHI34ctuqC21bOD+f53dLNIWwkhGeeY1KjGU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_122313_234169_E8B06436 
X-CRM114-Status: UNSURE (   7.61  )
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

--MP_/bduRHcIgi7cE_At8/bu1uhd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Masami,

I applied your patches and enabled your ptracingtest code. I noticed
that when there's dropped pages, the trace output is not in order:

 # trace-cmd start -B ptracingtest -e all -v -e '*lock*'
 # taskset -c 5 echo c > /proc/sysrq-trigger

On reboot, I ran:

 # trace-cmd show -B ptracingtest > /tmp/trace.out

Then executed the attached perl program:

  # ./read-ts.pl < /tmp/trace.out

And it errors our:

 30.212495 < 30.213534
           <...>-1048    [005] d....    30.212495: irq_enable: caller=irqentry_exit+0xf5/0x710 parent=0x0

That is, I think the zero timestamps may be messing with the order.

-- Steve

--MP_/bduRHcIgi7cE_At8/bu1uhd
Content-Type: application/x-perl
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=read-ts.pl

IyEvdXNyL2Jpbi9wZXJsIC13CgpteSAkbGFzdCA9IDAuMDsKd2hpbGUgKDw+KSB7CiAgICAgICAg
aWYgKC9eXHMqXFMrXHMrXFMrXHMrXFMrXHMrKFswLTkuXSspOi8pIHsKICAgICAgICAgICAgICAg
IGlmICgkMSA8ICRsYXN0KSB7CiAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ICIkMSA8ICRs
YXN0XG4iOwogICAgICAgICAgICAgICAgICAgICAgICBwcmludDsKICAgICAgICAgICAgICAgICAg
ICAgICAgZXhpdCAwOwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgJGxhc3QgPSAk
MTsKICAgICAgICB9Cn0K

--MP_/bduRHcIgi7cE_At8/bu1uhd--


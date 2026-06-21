Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC9CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpwTUV7cMr9DZyt+PGfboKuTJxbESBW6N7Y5Sf43YLI=; b=Ht41CnsDrlThA4EZrAHrT3Qs0E
	E1tmVaJPXnuEeRxgFR63uOt1WeaaJ5O6ld/eXK2bkBny7gqyYq3b0MI7I93iRD6Ckx9eKDB8ul12y
	opc3U0+QoHu8WstLdnAUW6sk+ldGb6/COLqjZomWo+YQLHIdoWtIb4jl34WQ3vIdRHcWjd6xwes1v
	7BIa4BGfGOM6ZPAaro5QjFREpMUfBXkfopJrPUNRVLALt47Y/kY4ybntQ5GgQkIc6An3BAPxC5D7i
	7MI0RZDtIG/EDGT/esqWQ5CGQ841osb7mRjvRS/1bQvMgDGUIrXPgw+oC4N1g3f8R6vE6n1XwtzE/
	WTkZ07Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJ3e-00000003zZS-2h1k;
	Sun, 21 Jun 2026 14:21:58 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJ3b-00000003zZ3-3T3K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 14:21:57 +0000
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 36393166CE4;
	Sun, 21 Jun 2026 14:21:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 1169420026;
	Sun, 21 Jun 2026 14:21:46 +0000 (UTC)
Date: Sun, 21 Jun 2026 14:24:07 +0100
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>, Steven Rostedt <rostedt@kernel.org>
CC: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_tracing=3A_Move_non-tra?=
 =?US-ASCII?Q?ce=5Fprintk_prototypes_back_to_kernel=2Eh?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ajfiVTlCIVlqW3sh@yury>
References: <20260621093430.264983361@kernel.org> <20260621093811.007634476@kernel.org> <ajfiVTlCIVlqW3sh@yury>
Message-ID: <C4ED8F5F-042B-43B6-B17A-7C3E2743E48F@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: m5id8uysanmtioempn6emsnsdgs5phht
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 1169420026
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19WinE5LWQa8HzvFNjRdlGwYann5/w38N8=
X-HE-Tag: 1782051706-894210
X-HE-Meta: U2FsdGVkX183C80JzklQEIa+kgNTjJZOknF6vAmyswd98TyGVgTRC8SyVWsz19w9BPwppSUtPiaeZPJXrIQbsy98gLBfQ1cJQl7yzp34fic0gzv0s9hrB6mxeJXqinMntnlfXe73gJIH/D2pt50tZwbP93X5621Z+n1JPgBDPeg2Qqz5v4YTHrFVzIaZ3VcUXUAKuj/7BGAd4D8VuUGw+dkVUMzvtoZoN/seDFwcReGQTYquH+YMzJ815xl7wR46FpiJ9+THR6XRxVuJCVh6iJAhD/ahytYNQMcMNmgFRXblBTPxbXFH63lW5Djcit4yMB+uNazqknvOnTkAw3vbLAB4CMkaAooU09WOrb4dRD5m5BQTaIQKdR+GIKMYTEwoPVIlbOYXwm+XOsikcSvwWkIxSgSJzlVeOeQCU6+wcUsByy327CPzOKFxszsj4v/QYc8SsHkTU40=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_072155_946037_5FC0C7BD 
X-CRM114-Status: GOOD (  12.01  )
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



On June 21, 2026 2:08:37 PM GMT+01:00, Yury Norov <yury=2Enorov@gmail=2Eco=
m> wrote:
>On Sun, Jun 21, 2026 at 05:34:31AM -0400, Steven Rostedt wrote:
>> From: Steven Rostedt <rostedt@goodmis=2Eorg>
>>=20
>> In order to remove the include to trace_printk=2Eh from kernel=2Eh the =
tracing
>> control prototypes need to be moved back into kernel=2Eh=2E That's beca=
use
>
>Please don't=2E Instead, you can split them out to trace_control=2Eh, and
>include where needed=2E I actually have a prototype for it, FYI:
>
>https://github=2Ecom/norov/linux/tree/trace_pritk3
>

Sure, I have no problem adding another header for this=2E

>> they are used in other common header files like rcu=2Eh=2E There's no p=
oint in
>> removing trace_printk=2Eh from kernel=2Eh if it just gets added back to=
 other
>> common headers=2E
>>=20
>> Prototypes are very cheap for the compiler and should not be an issue=
=2E
>
>It's not about cost, it's about mess=2E kernel=2Eh is included everywhere=
=2E
>Is that API needed everywhere? No, it's needed in literally 10 files=2E
>So, no place in kernel=2Eh=2E
>=20

Well one of those files is rcu=2Eh which is also pretty much included ever=
ywhere=2E But OK=2E

-- Steve=20


>>=20
>> 2=2E53=2E0
>>=20


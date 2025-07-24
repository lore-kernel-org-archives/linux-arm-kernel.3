Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D408C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fi95qsoY1nRhMhK3e9Az3nxyTRB8oPnFybMvNI3nd8=; b=c3vjBdx/pNZSMz3OPbitw1awCO
	Iga874RvL7qyRpj1w91dbKs2XgX5fDak0grx4GY7l87ZZUKLMHc3uJtV8xogcfAj8j0Pl+NQxbxzT
	4LjCNOFo+lIGthYfsdn3auR92Zv5TbFHceIv+MunrAzE+BX/FvipN4JJMMupDq/FOMzAduwTkKLnK
	dMpza4sZYCISz6buUOwteXPR3GcMpJe8A6XwncbhQT3Q9sTMwS2uxinc5e+HAVyCm4EI1BwqPQUxM
	rGY6RTPvSZnxChPZAbGmigldnk9oKbw8PMCqdFzS2kOSvW0dEstoo2EjnXPJfqBUGoxAdaw49MIZ2
	5H3GYz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoX8-00000006VlW-17xP;
	Thu, 24 Jul 2025 05:30:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoUh-00000006VOs-1HuL;
	Thu, 24 Jul 2025 05:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5115E601DF;
	Thu, 24 Jul 2025 05:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CB1C4CEED;
	Thu, 24 Jul 2025 05:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753334870;
	bh=nmw+e1nSY/Q+eQ8hPyS2qnwcN+bh6S6UuHHOkJBf2xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C00D2bssKPITaNtJ1UVM8Y357OnzvFJLrZpcrLKNLLB92JvfBmyPs5lkhp2Z9RY/k
	 XxLBmPHHJvSBxsMN8MahoCwvf7FlRGQqtHAaHTZqEUOvPjf87lj8zayTw6cbUmDYcC
	 KhYENGGfpP2zydDwc+IULYzIZ2APLHB8Rfh1hwSDLzGW924rQVWU1qzg8pWDkFU7Xn
	 zp6HXiNfVKU2vkHhemGtFPQDd+R1u6q6GHk4W/KM4P4Hd+k1tVBZmqxTDkBJT99nvu
	 2f+c34H6TJP8zZ0gyhNA6UfuEajlIfL6SdXWz1i4SsI2FxWfaM5IzlxIGB/BB7J+9z
	 nuFmbmC0Kjwmg==
Date: Thu, 24 Jul 2025 10:57:39 +0530
From: Neeraj Upadhyay <Neeraj.Upadhyay@kernel.org>
To: Tze-nan Wu =?utf-8?B?KOWQs+a+pOWNlyk=?= <Tze-nan.Wu@mediatek.com>
Cc: "frederic@kernel.org" <frederic@kernel.org>,
	"joelagnelf@nvidia.com" <joelagnelf@nvidia.com>,
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
	Cheng-Jui Wang =?utf-8?B?KOeOi+ato+edvyk=?= <Cheng-Jui.Wang@mediatek.com>,
	"josh@joshtriplett.org" <josh@joshtriplett.org>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	Lorry Luo =?utf-8?B?KOe9l+ejiik=?= <Lorry.Luo@mediatek.com>,
	"weiyangyang@vivo.com" <weiyangyang@vivo.com>,
	Bobule Chang =?utf-8?B?KOW8teW8mOe+qSk=?= <bobule.chang@mediatek.com>,
	"urezki@gmail.com" <urezki@gmail.com>,
	"qiang.zhang@linux.dev" <qiang.zhang@linux.dev>,
	"neeraj.upadhyay@kernel.org" <neeraj.upadhyay@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>,
	"joel@joelfernandes.org" <joel@joelfernandes.org>
Subject: Re: [PATCH] rcu: Fix delayed execution of hurry callbacks
Message-ID: <20250724052739.GA15723@neeraj.linux>
References: <20250717055341.246468-1-Tze-nan.Wu@mediatek.com>
 <aHj79rtgLm-7tT9E@localhost.localdomain>
 <2c69ead1047ff7b7671b8b577fe69884870f66fd.camel@mediatek.com>
 <092ec583-9ad4-4d37-8dad-6008267a56a3@nvidia.com>
 <f7fce1ac56b908d49bf75359dd679d6664b648bf.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7fce1ac56b908d49bf75359dd679d6664b648bf.camel@mediatek.com>
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

> > Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> > 
> > I suggest let us add the Fixes tag too so that stable gets it.
> > 
> > thanks,
> > 
> >  - Joel
> > 
> 
> I noticed that I’ve already added the FIXES: tag, did you mean that we
> should also add this line "CC:stable@vger.kernel.org" ?
> 
> If that’s the case, should I submit a new version of this patch(V2)?
> 


Thanks Joel for reviewing the patch! I have already queued it for 6.17
[1]. So, v2 won't be required.


[1] https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/log/?h=next


- Neeraj


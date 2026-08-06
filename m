Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D399C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ePEtl2m67fNMAuLJ9Afbk/hABXEN6patEcXoPge2F0=; b=VkLRfG6VG7KMP5XZBDhnPAxntq
	rD1hZpYmk/1cE4HTcDdeG1wLPQZBPeb3nQsBaqqh+SZJyzVZIEQJG3CisKso2W9Jxko+kImddAqj4
	gLILwz9ea2q8VnSTbJyZlzZH3EfdxYQ4qL3noEPKfc6qfSM5ndC46iiqZ0aHg/1tDJnYlXItypI99
	12gEAfTZet4TAx5bowgvExT1X6a37fwGYIlIMw8CknaNQXXTKhkvbkcgGSC+LMj9MI5QFr5YimhQu
	ifaOJU+Ja4mGaCa3q/QcLxw/v5qTeUn0rXs3QfVWLfASB6aKCS9AwTreXggCHdOHscw8n/Lwxq8wy
	EGS3wJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtj2-00000005H0k-3D9q;
	Thu, 06 Aug 2026 08:45:16 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtiz-00000005GzO-3cby
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:45:15 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rr5EcI6quzZx2vYTQd0BNfDUsUSUD9gsrbQ7qXWLAD8OJPy/p6scRBXGSeYTnUk+TASo2CF0d+BkD6ykGr/aEtK@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786005911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ePEtl2m67fNMAuLJ9Afbk/hABXEN6patEcXoPge2F0=;
	b=G9eqSxnGYsUchiUDeDKv91I2edQEXkNi8yTJ0Csb2wMqmKt3g63Yv5zVzsjdQv3BnVHj5l
	b8jXPUBPck92atQotQKGeFilfrli8oedb5B4Ui7bKDU4LOWC3raPOFMzh01sm5lFD72h5Y
	9GrcXjUfQqqqQWIdnjgd5XFJ4ZrqqRs=
X-Gm-Message-State: AOJu0YyvbxyDuo50E9kngwI7xXTW4JmPuQCzRC9jNjVszTtiOKglUG84
	XmJAp/isO4W73B1f4mf4RZXaNqOHx+4pXEEjgCtiwWt0PoOWLW3QjTjVhKb7tO9JgEmG3yjK5t8
	W6iSQTYiKhaUfKUG9XcC4ZlsrpDPkOKKYfyfOkR/O
X-Received: by 2002:a05:622a:4885:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-52cfea4c54fmr11135181cf.13.1786005891634; Thu, 06 Aug 2026
 01:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
 <20260804112317.1937387-2-fuad.tabba@linux.dev> <20260805165432.0118a513@gandalf.local.home>
In-Reply-To: <20260805165432.0118a513@gandalf.local.home>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 6 Aug 2026 09:43:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxZ1tBfau4eK-nOdqig1xwngzsq8YyHtiE-iAMkZpSF8g@mail.gmail.com>
X-Gm-Features: AUfX_mx7LtwidANKMNRCu_ciAI4sGIOLaBR410JmLmjAj3CDd42EszWO5YDN5aw
Message-ID: <CA+EHjTxZ1tBfau4eK-nOdqig1xwngzsq8YyHtiE-iAMkZpSF8g@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] tracing: Include linux/types.h in trace_remote_event.h
To: Steven Rostedt <rostedt@goodmis.org>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	mhiramat@kernel.org, alexandru.elisei@arm.com, vdonnefort@google.com, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014514_046456_DF7AC0E7 
X-CRM114-Status: GOOD (  12.86  )
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

Thanks Steve,

On Wed, 5 Aug 2026 at 21:53, Steven Rostedt <rostedt@goodmis.org> wrote:
...
> > --- a/include/linux/trace_remote_event.h
> > +++ b/include/linux/trace_remote_event.h
> > @@ -3,6 +3,8 @@
> >  #ifndef _LINUX_TRACE_REMOTE_EVENTS_H
> >  #define _LINUX_TRACE_REMOTE_EVENTS_H
> >
> > +#include <linux/types.h>
> > +
> >  struct trace_remote;
> >  struct trace_event_fields;
> >  struct trace_seq;
>
> My ack still stands, but I wonder if we should just not use the include and
> instead s/bool/_Bool/ ?

I'd prefer to keep the include, if you don't mind.

As far as I can tell, apart from the typedef itself, the only headers
built into the kernel that use _Bool as a type are a uapi one and
arch/um's user.h when it's built for the host, neither of which has
bool available, plus what looks like a leftover in bcache_ondisk.h
from when it was uapi.

The include also covers whatever field gets added next.

Happy to switch if you'd still prefer _Bool.

Cheers,
/fuad

>
> -- Steve


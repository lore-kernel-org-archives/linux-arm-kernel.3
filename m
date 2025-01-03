Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB48E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WF98epXw3Qv4CPbGrRECANv2+XQKUkVYnJNebl2i+cY=; b=XJzgKnIfOGv77hPyyL6Fibul8w
	SOIemQmEPPhP/7dJfSkalXFeEJ1gSFUMxXj0kyCd/IVBRFTyigvf8DRRJyMuQP91WYjkEt6Xc8qOf
	FHcFsc63kFl95u8M7cCIpfuqLC+dGfq+Q9KZYILJpGo811I7l/DqQyzTTjsHIBgip/P3zLz4XxrMJ
	rBJQYDkewT/sVcDZD7N4kJO/nGBypSdK9gIt65q7NuxqKe9kvdv+JrBhn0kIhv38vuKwYcdEYJq04
	HsQW1d8y47/ZjTZtHyHsr4qtTN2Ghm3Av7n+oUhTiprxvy4G0LK3EmL63+oCYFhgJPy9fgFh+uMsx
	GxmUbZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjgN-0000000DIUs-2ZV1;
	Fri, 03 Jan 2025 15:33:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjdo-0000000DHnp-1V8R;
	Fri, 03 Jan 2025 15:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AA685C645F;
	Fri,  3 Jan 2025 15:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0917C4CECE;
	Fri,  3 Jan 2025 15:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735918271;
	bh=WF98epXw3Qv4CPbGrRECANv2+XQKUkVYnJNebl2i+cY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tcpYtjvND1iL1I5IXZ1WoMXTgkM62MCXZoV9Cyi/B4KjjcCpfCkLfzmjCl07me2Nr
	 Puyi2zLuPSpzWJxcMDpxx8JxqCiiLoi6l35mejj66mMjmxZ5Jvj0qUYwyJ2K2hPeFn
	 t7WkXhUFRJszM90uWcxTlmV4DOta2asykROg+b4yyR5Xzkxo+UP69XY6XV8OSeqD+t
	 ELOIiUaxp3XCKU9EhpTJOZlHsDDlRT2LZGjf9S4QhE63JBvoFiySMvwmAhOxQWwF1T
	 fSzbWeEDIUzO1uv2FPUxMKJ5BEpOYNqNPwnMcQNJDYLnRfoayf1jos6st2H124B0OT
	 hwR+HFZREtkfw==
Message-ID: <8645aa77-eb46-4d87-94ce-97cd812fd69e@kernel.org>
Date: Fri, 3 Jan 2025 08:31:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Content-Language: en-US
To: =?UTF-8?B?U2hpbWluZyBDaGVuZyAo5oiQ6K+X5piOKQ==?=
 <Shiming.Cheng@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 =?UTF-8?B?TGVuYSBXYW5nICjnjovlqJwp?= <Lena.Wang@mediatek.com>
References: <20250103054413.31581-1-shiming.cheng@mediatek.com>
 <76edb53b44ba5f073206d70cee1839ecaabc7d2a.camel@mediatek.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <76edb53b44ba5f073206d70cee1839ecaabc7d2a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073112_437069_09AC4C9E 
X-CRM114-Status: UNSURE (   7.92  )
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

On 1/3/25 3:27 AM, Shiming Cheng (成诗明) wrote:
> Test cases will be provided later, below are the corresponding IP rule
> configurations for IPv4 and IPv6 that i provided, as well as the
> differences in ping results, the IPv4 result passed, but the IPv6 result
> failed, after adding this patch, the IPv6 result passed.

I do not want the output of a complicated stack of ip rules with a ping
a command.

Provide a simplistic set of commands that configure the stack and show
what you believe is a problem. Anyone on this list should be able to
quickly reproduce the setup to verify it is a problem and investigate
what is happening.


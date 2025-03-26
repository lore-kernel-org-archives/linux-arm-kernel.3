Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC79EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEj9vLTGFHgb8vvs2kbTxuc47+Hc8umbJs7qvDEFDCU=; b=OA8GrgD2juoQc5oQvkNrMJElOe
	j9G7G2VBqSaeMJkfBAN6gCW0/bdJ7Y0I3gu9rjLBiQ+HMBneDuav0bDgwgHVnmCFyJVGuPhzGa4x3
	0qVxFspaRRxZ+sbn8UaNVyowthdCMcJom+IlI7bgNvggPzjd4bvkiLkSJWVBtqK7x1XmNtAuUAN74
	O+JcV19AXoOuN3ynmJbOxAvVlAh/YTFmo+F2175dVsGi4c7flXrrTEKUN2q8AoC4Cx1KMz+QyxzOt
	1mAprDS66eiHCuFXfmiPPmHmxS3ALDUGp5kOADWaOIEluD3usBszlAaVmASOM7S2ks/8kUVRX9yFk
	R9Ox2bkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLiP-00000007rTj-1DHF;
	Wed, 26 Mar 2025 08:02:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLff-00000007qWE-27jp;
	Wed, 26 Mar 2025 07:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B01365C1B99;
	Wed, 26 Mar 2025 07:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE02C4CEE2;
	Wed, 26 Mar 2025 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742975970;
	bh=GI0HQEGuZP8iCCZJg2AMr3qkP7ZGL5n1MxX6572zavY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mii7FSDEvFTIAGrC0zIiB8VfHJ0LAz2AuvEB6RwVbZDHtcEvmv3k0ttHgz/3ZDgH9
	 MmZiI/HbumLEAUeKQWpPVH/EnqYeit9AxUYuN2d0DaCAKn0SpLAGm6lTffw6m5kyhn
	 lTPXuo+luSJM1lqdiVIoxyFORwBKXAWltA3XaDs0/iQts31mlWzW+lK2k3fkTeiMzG
	 bHC2I9xdZZhP3bXGV/vvZ2z90C15VvvyruQdTL0Iih5JxI5SgRmZMaU3F9Ox4V+4w3
	 BwooPt8PPOJBzBeLa2aIpIyf1On/i5cSZQc8fjJXEdWY1zNhaGvns+YBklFSJAq0mF
	 OzPng0TxkXGyw==
Date: Wed, 26 Mar 2025 08:59:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, hjc@rock-chips.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: rockchip,inno-hdmi:
 Document GRF for RK3036 HDMI
Message-ID: <20250326-poetic-happy-peacock-a79d29@krzk-bin>
References: <20250325132944.171111-1-andyshrk@163.com>
 <20250325132944.171111-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325132944.171111-3-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_005931_597579_230B6762 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, Mar 25, 2025 at 09:29:36PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
> is missing when it first landing upstream.
> 
> Document that it is mandatory for RK3036 HDMI.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)

Where was v1? I cannot find it.

b4 diff '20250325132944.171111-3-andyshrk@163.com'
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 7 messages in the thread
Could not find lower series to compare against.

Best regards,
Krzysztof



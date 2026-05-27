Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D74CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 02:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6X96fCiiUtZy7vCtG5EjDCaHqggdWfq0rJbxB68zFQ=; b=cyJ/HLD54s4KU6AuqEp7DSbiOF
	FvBbuuxfqmro49DTLzXRXzC/733KGUeE3YRfgSieLh/Ywo4V6k/brukvdDrfGEHbFAONfrnqbXRxr
	b5UDmR21YmxmGG5oU7oTqDAxzOX6kzPHi4o/MchiwjWskjIiQJbLaFSQMcA0ea9fYEh7lJ1grUmcE
	fcEjlUTr2JkjObx7QYIAGLu9OYrEpCNPcfbFh4B5BNPtNaviTDAsP6f6ihopIWIHh+8jUCHGEIs/7
	8HLlrQDgm+XZ57ya0QWfB4fU/3pj+2kxTXMws/MHeUOEYZsRHUz1rS5q62hiEM0fCWM0i1hgEZKtW
	af1ZtS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4Ag-00000003Atx-1Bk5;
	Wed, 27 May 2026 02:39:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4Ae-00000003AtX-1Gi3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 02:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779849538;
	bh=s6X96fCiiUtZy7vCtG5EjDCaHqggdWfq0rJbxB68zFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DYB3eydzT8IPzY0KJPLgjOnUrH/Rci9Ku8LhD/2WsdQdlYwpjM5CHknmNv0R29sUg
	 o9evBWo298eQCyVVQVGPzQ8+FceW3/LBNvUkJbPuAU8DMpMEFHwsb++kos53dMWZMp
	 cR5UP2ClNYnNFx/irO41O8QmmkeLq733ef5gidPbfQxBR+X2R96WsYAwDt3bv3dDKK
	 erN9V3ueEEsxvQT7vDmiKR6fUzXgvP27RJi1wAGcn4JINXilLzILWtXjkwLu8tUSYz
	 JJD5Nmp/Dd4ZrUd5uKt7zpemnkZch9AFW2XouoOVPfpMEbx2ZR1J3vDybx2ItbQufk
	 NTEWXCoerO6UA==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BAB2C6001B;
	Wed, 27 May 2026 10:38:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus
 Kommando IPMI Card
Message-Id: <177984953766.356210.4909123426054062345.b4-ty@b4>
Date: Wed, 27 May 2026 12:08:57 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_193900_536522_B9CB8575 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, 31 Mar 2026 09:18:00 -0500, Anirudh Srinivasan wrote:
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
> 
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



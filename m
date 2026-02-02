Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D44E7DEE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9q22FsWlE6guDtJm/Wf/hE0WHjYN8IUDMo1cDdPQiBw=; b=eGk3DVZa/uI6+DeDUWJ7SfDaUk
	ynpxHx0SzfMHEm0JjbcMCyDFu/tIr5ZDC2NJ0jtsMhHasJxEEzxEd8gC8eTDDg5m8IRvI83Toutdm
	vxBaP8EO1LkyLCKmiL6LPmwzBglXO3eX8M0sfEz1XLLznXZHySCqwGY5oMoIAE9Nv4kOBDgDyYlOz
	iHRQMRnb9vGoJj/5ckqz8a9FYm30SCKLsCBNRm+w7p6GmTXow1aAG0ir/g2dalsy1MSkyqxKgKpBJ
	qHYVnSDLZvB6DYCFW8VnETNVQvhMHd08J92UmL856nBbYQ13ce7KCvddsxvsAmHEdEQPtmctIpje7
	gm/i9mfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuTx-000000053yh-3Hep;
	Mon, 02 Feb 2026 14:00:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuTv-000000053y9-0eE0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 14:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9q22FsWlE6guDtJm/Wf/hE0WHjYN8IUDMo1cDdPQiBw=; b=VFo0HZgG6NrGOfClCLnLJMWlZK
	X20yLz70VNTgN0AZwZyZK4FqFXNaJiIl+jHgd4h6xMgHG+9kiRzpXfTDi4tn1Va6PjJ8+3jwnizru
	Cg3wpHnBAfctRxqb/kTi+0mztbL/+l2gGv89w8T0q1tqEp6V28E6LIMrNQhKLvfB7ifM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuTs-005pdx-8E; Mon, 02 Feb 2026 15:00:44 +0100
Date: Mon, 2 Feb 2026 15:00:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, cristian.birsan@microchip.com,
	balamanikandan.gunasundar@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ryan.wanner@microchip.com
Subject: Re: [PATCH 5/5] ARM: dts: microchip: sam9x7: Update the tsu_clk to
 use the generic clock with ID 24
Message-ID: <7b4d2c8c-aab6-4009-9caa-04268439f597@lunn.ch>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
 <20260202104025.3781-6-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202104025.3781-6-mihai.sain@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_060047_187034_28A9DEAC 
X-CRM114-Status: UNSURE (   7.49  )
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

On Mon, Feb 02, 2026 at 12:40:25PM +0200, Mihai Sain wrote:
> Update the tsu_clk to use the generic clock with ID 24 instead
> of ID 67.

The commit message should explain the "Why?" of a change, not the
what.

	Andrew


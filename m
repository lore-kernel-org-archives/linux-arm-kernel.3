Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2F5C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhcSVT0ilThLTEqD751qEwwwjKQxPdQ/g5IW8iOJnYo=; b=lWaMlivUWyAdyaWmsowAZf/lVv
	YLjw9Ru13I5Jv8yPRu5Fm3d2TSR+k/VR9oCqupk6mNF5Qv6bz2cmVFLo3Cy/mJvSgLd1HUmhDHKA3
	QSeKY5CA04D+ZZKPB8B27cet2/RmgtLAy97oohOzBjbVPgUqKQTfDStl2n9g7d+vBfG5xXwzzW5EY
	erhrqzQaQNDM+nrw95ExgpjS5B+SCsAYbHZXs3iZqGD9FLbZ2Yk+f+XSZgWDP00FIr8zr5UJHEzO4
	mXZJVOiVzfwDp4Lt2Att6NsSSu+YkYjhCglp5crLbxoH8CVb8+6t7XnHC8r74A5BkBuBA5LqD/cUj
	aPd586ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEow3-0000000CNxM-47ty;
	Tue, 13 May 2025 12:40:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEotw-0000000CNhQ-23ka
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IhcSVT0ilThLTEqD751qEwwwjKQxPdQ/g5IW8iOJnYo=; b=NOQRx7XTuoWUjZfRP5o5Wstmex
	gr38zDZCcGap0v5IKV9arZyd1u8H0b/FM7OA43lGWEWAYIpM/SHW/D33/CJJ5Py6TbFMw3w5b/al2
	a9yDwQIp8lgGHYABQ1Cv599sS1w0/trmB0ctEXHkrh+Qp4h9v9OqeAQlotRpN/POvPQI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEotg-00CS3N-90; Tue, 13 May 2025 14:38:12 +0200
Date: Tue, 13 May 2025 14:38:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <bebe4a75-0d7d-424e-a217-dfea710b3262@lunn.ch>
References: <20250513031010.267994-1-LeoWang>
 <6822b851.050a0220.27a24d.d071@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6822b851.050a0220.27a24d.d071@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_053828_527832_0DAAF8B2 
X-CRM114-Status: UNSURE (   5.89  )
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

> +&mac0 {
> +	status = "disabled";
> +	/* phy-mode = "rgmii-rxid"; */

Did i already say this is probably wrong?

	Andrew


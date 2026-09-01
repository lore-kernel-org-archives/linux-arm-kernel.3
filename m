Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DFEC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBIciBePJHu4TIWKwdlTXJQRXcfr437nv2k1+x9xHR4=; b=y/Tp7dqhzqx1s3VBPdMhTa8GEi
	jbCO8OvPYZiuCQGW9frTTWAH/WUOvLxmaHD5mvsH+ikVDhVwMRjPZqiFF4sQLIQlyiOb7oX81XdJO
	WVDdIJbDYuYGsg5RCiWFl9r6nWSK8A+4sf2/kLSCLw16TnTGiPKXff/24kQpQBT9RYGf7YkPZytD6
	MQO+tNhVBuwWSJGTSqV80dRZRmt9iiWHM+EyDQFmfKnyS0DFlKkhmXIU5tZSCJzF+jpf9Vd0lXGKA
	VZnATVgovkF3mG8xKPi+qxIrJ1pcuG3oBmgJbDLs7tOrJxoOFcEmVUWSGkQB+jqLRYCO69nc/aR+2
	UEyF5Xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ebf-0000000AuIc-07YO;
	Tue, 01 Sep 2026 02:52:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ebc-0000000AuHZ-0xXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RBIciBePJHu4TIWKwdlTXJQRXcfr437nv2k1+x9xHR4=; b=N56MgGkHsZSpLfM4B1uuwf/LjI
	FzLViVUW/IzxNJuNpKNa96HeXLGVjxqUaUb6/vAolsBCtofUzpxGVx3dEmjoJyjYygalDN0PwL9L7
	doiYZZa4HXe5iLC39O+C2E7raTdbxc5qQW4jhMIRSHdVwQDZQzYMR6MKBY+IjUD0qvO0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1EbT-002I9V-HN; Tue, 01 Sep 2026 04:52:03 +0200
Date: Tue, 1 Sep 2026 04:52:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/6] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
Message-ID: <fe83c236-ce55-4c33-aa1f-23028e978696@lunn.ch>
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-4-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831150816.1020883-4-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_195212_267932_C99B4DDB 
X-CRM114-Status: UNSURE (   7.07  )
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

> +	/* This error handler runs only for the legacy embedded-DMA (1G) path,
> +	 * whose mac_init() cannot fail, so its return value is not checked.
> +	 */

Is legacy the correct word here. Have you stopped licensing the 1G
MAC?

	Andrew


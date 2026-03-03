Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB13EB364A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUKL9Y5s8qQvy223sWGjb++3da04HXQ26Z6GEuwMerc=; b=OEqSpGqt7r3PLPqmj50cSDVIpR
	urkWcm7eruPpR+4b4EJnlAn8spz5HjU6JpYd/7pE1WlJbb5u8sL9AXe6i+q0PKbQFXB5jVhMq1Mh1
	aiqqziXibKAI1/w0y7psWJQlUnpl8+hbCFzEpsblOjeujhnYGh1AUJKRNCbDHkmZutqyezErqooCA
	oqumm0ZZWzopFprxnl+VIJbvEHFwp3YpLxXa8BOAKVFQrd1PfNdP6UoR3wd+zK5OudJQITYX2dEA9
	KcNPvYII8zqEtXqXyf7ovrd8VFtFILwWobCT1IlgvCbLOGHIvnmiQRQz30Tj1Cc8fPhhu/ORGhskZ
	I4c5lxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEbN-0000000ELSu-3Y75;
	Tue, 03 Mar 2026 01:31:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEbM-0000000ELSS-0LcL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 01:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HUKL9Y5s8qQvy223sWGjb++3da04HXQ26Z6GEuwMerc=; b=TF5B/smjiLlQUtcGCfFsFPta+Q
	1ont1wMORchdXMOo5dHeQKh92q1h4bXTT8IichY2T2BiPzhYhKw9xqEvdkPCBG6A50bik8lgs2ZTZ
	b0F8FKG1cnbzD68qMusKDyL+TXyi/JRRIkyxbRJ/c5cUfoXXONa7rrnAkTQctM7hqLR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxEar-009mO2-I2; Tue, 03 Mar 2026 02:30:37 +0100
Date: Tue, 3 Mar 2026 02:30:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v6 0/5] Add AST2600 RGMII delay into ftgmac100
Message-ID: <ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_173108_125150_2032B60B 
X-CRM114-Status: GOOD (  17.27  )
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

On Mon, Mar 02, 2026 at 06:24:27PM +0800, Jacky Chou wrote:
> This patch series adds support for configuring RGMII internal delays for the
> Aspeed AST2600 FTGMAC100 Ethernet MACs.

I've been thinking about this some more. And i would like to propose a
completely different solution.

What we are trying to achieve is allowing the correct phy-mode to be
used in DT, rgmii-id. Being able to specify internal delays is nice to
have, but for most platforms should not be needed. It is only needed
for badly designed boards where the designer of the PCB did not take
care with the length of the traces.

Part of the problem is that the MAC driver is not actually
"broken". It does what we recommend, read the phy-mode value from DT,
and pass it to the PHY. The real issue is that the bootloader enabled
delays in the MAC, behind the MAC drivers back. Because the MAC driver
is not "broken", it is hard to "fix" the issue in the MAC driver.

So lets solve this in the bootloader. I suggest you patch the
bootloader to no longer enable the delays in the MAC. It also needs to
patch the DT blob. If the blob says "rgmii", change it to
"rgmii-id". u-boot should be able to do this.

That should give backwards compatibility:

* Existing DT blobs with old bootloader gain the delays in the MAC.

* Existing DT blobs with the new bootloader gain delays in the PHY.

* For new boards being added to Linux, we NACK them with "rgmii", tell
  the developer to upgrade the bootloader, and use the correct
  rgmii-id. This is a power we do have.

* Developers of existing .dts files can submit patches to replace
  "rgmii" with "rgmii-id" once they are happy all platforms have had
  their bootloader upgraded. That might be never, since developers are
  lazy, and we cannot force this on them.

	Andrew


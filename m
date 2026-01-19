Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F27FC619B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdLUv90Yj4SfljUabA6T05v2y+dukg4xbcWK9twXbTg=; b=eclFEpRBjZGJIqrNtZldLpFn6z
	3MEf/z4FuOe4jd7AJBuc6BqOXWoGY2vYDv8URYnBTg0iqOfNHFs2T3jlTaRR0s26RFvVQoaYwp2sX
	K1klYr+kQDnqAALScRoz+SJDttC8KwHLC7sO/8f5Ry571rRXDDji0RBo8csnm2Qi1dmESuMfQj7Gv
	1rp4Bz1Gv2WnS7qZCDiQbGmoBagePtcl7jftg1R2tzfstuipcXfElYZ/YU11ZLUpJU37TVFgAFasg
	FJGsDR1mOqf8Q84kxVdaa0w0e4EXVBHJ/YQ7I7m/bK5dbVDSr5ewG0Jzs5Wg5s4XByiA8jdDj1T7X
	/4eAlSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvsM-00000002ppz-37M9;
	Mon, 19 Jan 2026 20:29:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvsJ-00000002ppa-3NZL;
	Mon, 19 Jan 2026 20:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KdLUv90Yj4SfljUabA6T05v2y+dukg4xbcWK9twXbTg=; b=j4Wpo5m6oYwy3U25GY6effkpZg
	hcJkTTUQgzzpOZW77TqWL9IWtDh+QeDTlI/leYR0PeBrq4pK3VliXVLgM3HrK9JkN8/nBDr+DQcB+
	YnxSzAnQ8aiIJOaGBcI2hTpke0n5RkhlT82uN5VO2sjlNtdinlF+Zr11U59Q9ZCPb4+g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhvsC-003Yxl-DS; Mon, 19 Jan 2026 21:29:16 +0100
Date: Mon, 19 Jan 2026 21:29:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <2b716edf-23c6-427d-beb5-16127b8bf429@lunn.ch>
References: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
 <20260119-airoha-npu-firmware-name-v3-2-cba88eed96cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-airoha-npu-firmware-name-v3-2-cba88eed96cc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_122924_541118_EAC6117E 
X-CRM114-Status: GOOD (  13.74  )
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

On Mon, Jan 19, 2026 at 04:32:41PM +0100, Lorenzo Bianconi wrote:
> Introduce the capability to read the firmware binary names from device-tree
> using the firmware-name property if available.
> This patch is needed because NPU firmware binaries are board specific since
> they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
> MT7992) and the WiFi chip version info is not available in the NPU driver.
> This is a preliminary patch to enable MT76 NPU offloading if the Airoha SoC
> is equipped with MT7996 (Eagle) WiFi chipset.

I _think_ you need to add the firmware file names to the end of the
file using MODULE_FIRMWARE(). That gives dracul, or whatever is
building in initramfs, the information it needs to include them.

	 Andrew


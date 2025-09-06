Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA12FCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 01:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STF4tTQnHJXp4fxYPtE1M6aoesq6Vw/hoso9wn4wC80=; b=eJMAR1vuHQf5AS
	MRbNfx5jRdo0fKJOGo6ixPQPLHHC5MD8nCpqZ326oz6+Tmz6ujsDUYzCWrALUXVz3EkMUzFh3lois
	TKT7RNbtDDr1+XQOqQ/B+Kfm1xwqS4GA88LfGO5zt+4K11TdiTIgYvyyXlgfkBMCjRfIFfaQLoi2N
	GGyqkpm2Fg7p7OJ112cAUQFi4n8SbcydSz4LUD1T9UeN4B9rIiDt1KV3ZxgIxkn4IVSQP3k7wTUEj
	LvgWnMReeKOVQjgoaH+fOPtk9+nyQplwRhhs6Mm9WydrcqfEjvbRgi1LeJ+5idb/b6OqYSmhHowDU
	lxGk23+kEyGabxUTV4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhpL-00000005u1u-2kVH;
	Sat, 06 Sep 2025 01:34:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhmW-00000005tRi-0fnh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 01:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC22C44E20;
	Sat,  6 Sep 2025 01:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209B5C4CEF1;
	Sat,  6 Sep 2025 01:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757122313;
	bh=1rInwyzH408KpQIKEUF6ugiv9s7w8IarbTw4P1jhacM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TnB9AOLEOQenk/17CQrezaNbHqyR9yotyIQTjBSufSdIguG/4ULcLZYPtmXVnIZMf
	 q1k2gvd2FVt5XclCU+FWV3mN1YON7dmTQDdJYJyZycMWgOvmPCLRT4ilQZHDPsDtqw
	 B4k6te7eBKac9VJfT7O2LGBOYSoHUnEKyjYPDiu1onIEDMizOfPXdJ6fpjM0cahbGH
	 9Q8zqESV83gGsBXwJ7x35uCe6v7g9JLUAu9GggCLf+3DEAbTe4e+z5yBiJZR4aOzWQ
	 F0GVPAKsvkdgaZga+ATyw7hUTW8e9GK5jmfI3Q4WyRQJZ/gx3Nt1B3fMPyypmd9xwJ
	 331+g/fndaqHA==
Date: Fri, 5 Sep 2025 18:31:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v15 0/5] PRU-ICSSM Ethernet Driver
Message-ID: <20250905183151.6a0d832a@kernel.org>
In-Reply-To: <20250904101729.693330-1-parvathi@couthit.com>
References: <20250904101729.693330-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_183156_230233_4683EAD6 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: pratheesh@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, krishna@couthit.com, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, bastien.curutchet@bootlin.com, mohan@couthit.com, jacob.e.keller@intel.com, pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, conor+dt@kernel.org, alok.a.tiwari@oracle.com, richardcochran@gmail.com, johan@kernel.org, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, kory.maincent@bootlin.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, michal.swiatkowski@linux.intel.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu,  4 Sep 2025 15:45:37 +0530 Parvathi Pudi wrote:
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).

Looks like the new code is not covered by the existing MAINTAINERS
entries. Who is expected to be maintaining the new driver?
Please consult:
https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html


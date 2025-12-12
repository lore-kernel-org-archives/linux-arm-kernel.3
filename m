Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB22CD59F52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 23:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhnIQJhYt6frMQDEzUl2UnGpUcZg2IdR59Af7tBLeXk=; b=nkaiz2JYUwhuGfqLrcINiKd22q
	6H1GAeZePLwHaeuQ1swSSawm8ehlkQmkR8cUqP2b5GJvYC//0vRPqIoPzWcZAxm5f1cFJk2wfg3mO
	qYhj3H60WaKk4MfGSTJazmRcPIDGO91uLjgzx56yMsq+F43oOvMtWgy5YqbhiEpd0iaSgVNAxYCsL
	EQH1gxXOwJjtzAqj9cM42VGWC9LUlvXE5tcQiIfMaoDU6FwETUHLNN4504qUzjhBbY9TVZaZ7ex72
	QkKNGOfFX8INbq2NIJUHCqJGZtFQUSx7ql1pbKTHO6I3mx2eXcs5nbKeCMVLeoBZW43TZsMJ7cqJ5
	yduSXo0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCtz-00000001DuS-0xyU;
	Fri, 12 Dec 2025 23:50:23 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCtv-00000001Dtm-39BW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 23:50:22 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 27508240027
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 00:50:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1765583414; bh=DhnIQJhYt6frMQDEzUl2UnGpUcZg2IdR59Af7tBLeXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=IQHN9NBqH6XoW0ZtNjeZi1wjZRQmZ0qBi+JbzV8txcZT0MHwez4fkIPDH3Ld7GLwT
	 LfRcOcJIksGMHkiqhPOYE319K2+pTe4U9803UB4hpZo/c4dzV7ZS46VMbu3+ZHW4TM
	 GtWmV3md6VFarlCun5jqMJ5h9j0Y4HLzWiOCe+QsZuB0E7CyY0Xg/62zzZWbyMyj4d
	 jWMJsRfDKYhs645LqijG/tEWooDsJOkWAXbn4Lvv6aWLFhjs6qEQZsJoR8V8JDVUGa
	 eG2rO5Lknm2vHULNhE5IKNtq3fg89b4jNlge3AvXxq64N8BFdqNZ4ciJgJbod7WCzB
	 VbIvaLcvNF8rg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dSmR85RRtz9rxD;
	Sat, 13 Dec 2025 00:50:12 +0100 (CET)
From: Adrian Kossmann <adrian.kossmann@posteo.de>
To: andrew@lunn.ch
Cc: adrian.kossmann@posteo.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Adjust RGMII TXD/RXD delays for the Rock Pi E
Date: Fri, 12 Dec 2025 23:50:13 +0000
Message-ID: <20251212234957.591812-1-adrian.kossmann@posteo.de>
In-Reply-To: <57e99fa1-0e59-4129-bcae-b94df46447e7@lunn.ch>
References: <57e99fa1-0e59-4129-bcae-b94df46447e7@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_155019_935455_4D7989C2 
X-CRM114-Status: GOOD (  11.52  )
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

Hi Andrew,

> rgmii means the PCB provides the delay. I doubt that is the
> case.

Yes, however, to my understanding, there are two kinds of delays that
influence RGMII timing: Delays that are added onto the clock signal 
(TXC/RXC) and delays added to the data signal (TXD/RXD) by the GMAC.
The link provided by you describes delays that are either introduced by 
longer clock traces  on the PCB (rgmii phy-mode) or by programmable clock delays 
(rgmii-id phy-mode). Delays for TXD timing and RXD timing are described in [1] 
and are implemented by the Rockchip Ethernet driver which is bound to node 
gmac2io according to [2]. The example DT binding in [1] as well as other 
mainline DTS of devices that use the RK3328 seem to adjust RGMII timing 
via TXD and RXD delays and setting phy-mode to rgmii, despite having 
programmable TXC/RXC delays, at least according to the technical 
manual of the RK3328. So, in this case this may be an exception
from the usual convention that any RGMII phy mode other than 
'rgmii-id' is probably wrong.

Of course, I may have overlooked something or misunderstood, and I 
would appreciate further guidance in this case.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/net/rockchip-dwmac.txt
[2] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/tree/arch/arm64/boot/dts/rockchip/rk3328.dtsi#n982


      Adrian



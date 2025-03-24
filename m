Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CCAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 00:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWdFElbolN32IcSIukRd2p8E/VsngBvOblp9fg+S+xY=; b=xvzuBq77KAwjrUtVOb8nJzOcsT
	df8IZQ3DYXsMlpnZg694g8UBATZHQsWL8ElVSaxnsyQhPVnGyNbHdkeWe3NY8GZo+FSMk7NEU/kB9
	IiZVfkHVsoI/uEfjoH+54yekclbRv/7zirwuZ07ZVHseGcCJk1FdcTQ7Oz47yh1OzA/Y1BRt1drqp
	j6C+qioz9KBpoOacR9Y/OfVlyOFxp5krK5jZZBD8g8RGrosH+KUQ1Kgc5sIaj0+7nv49j3Le/UCGE
	VsFRBlaQEpI4r4pcJ6p2JvOS2oftFRbkBYUJ/kJoZGhGV/98tSNKl3H04nGQUnqCSVJW3JxrHoujn
	LWz4Ly6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twriz-00000004WGj-0MIF;
	Tue, 25 Mar 2025 00:00:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twrhG-00000004W5D-1B7q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 23:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742860748;
	bh=FWdFElbolN32IcSIukRd2p8E/VsngBvOblp9fg+S+xY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gS0Iydm/MeDjtnLSJdBetps1Xv0ZUqMP2L6gevOdlk9P4BuYUJa3X0+mAzh1KELYu
	 RpqKP0F7rqM7clhL4pPXc5sbOKWMm35GLhEwqB3ENEiQcSCiWPOJv4shasRNZrbEc7
	 N2bJK6ywGbu70kOZ9nQRl9AOtaLLwky/V6fCLtKmsoYGKtqm9ONzJEU5wYDUc9oKOk
	 u9KnOXA7OcCT/GnzMbnsg6wbc+/kZe35QawZCbDj+kovJCXAhJDPVf++U5iRpxjRT+
	 eGuYM063/xkB2Qmj2s+cGbijNsGY2zjC8ppTiwhL2whiZ/0+ymmAH/3/qdzgiGMWn1
	 F73EryAwms/Rw==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8CEC7B506;
	Tue, 25 Mar 2025 07:59:06 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
Subject: Re: [PATCH v6 00/10] ARM: dts: aspeed: catalina: Update DTS to
 support Catalina PVT hardware
Message-Id: <174286074647.923686.7149650911621706997.b4-ty@codeconstruct.com.au>
Date: Tue, 25 Mar 2025 10:29:06 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_165910_525469_66310F36 
X-CRM114-Status: UNSURE (   7.96  )
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

On Fri, 21 Mar 2025 15:26:01 +0800, Potin Lai wrote:
> Update the DTS file for the Catalina platform based on the PVT hardware
> changes.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>



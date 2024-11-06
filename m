Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39650D59F7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V35WscTPJJZa0kbCQI1v1lpPEhxmxrS3QjHONqjJA1Y=; b=zO9YjBOkxVQBwXnJuzcXQgsmek
	UzbVoSo/yeTYbqsGi0zOWeVTjWD2HguSXhTi7g1KFC2SdANq0vWYWO2MRROA23vYyw0liZ3vrR5ku
	zMx0wAieP3aGgEbAy1K6jvv/yDzTQWoA+7Aqviyl9Iq5z+hwzBPmq0nbfl4lcwduEzDlNXrA14Xxb
	Tcp3S4lEou+U8AJs8WIL4goG6/Vusvygn2Hqi9aA0DhtugqszyAgjdh2cniooPk5jpxR7JzOI2+nr
	Kyj3kdGAwIxhhLjhvqmrp/zqWqd55fKqPG68idcZxxVO+D8lgjdkuEIQqFF2rIr0AGrxiHuUMy0zg
	2qw2aD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pgp-000000055Nu-0xSO;
	Wed, 06 Nov 2024 23:43:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pf2-000000054jW-0znA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 23:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730936515;
	bh=V35WscTPJJZa0kbCQI1v1lpPEhxmxrS3QjHONqjJA1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JX+IWwM2IZKC33djCGZllfdL1g6kzRmzqS2dbraQZ9yX2gxdN200kEeNQAPxmmw/b
	 3ZMLeAZDM+IUbU0IczUPvUIwlK6HBNfxcl9jnimW+gI7Jaj4ksKEPptl6vsCwcJ6/L
	 ppnYjq2NZn7T/gev1C9gOlYyPKpqbbYowo7vxCe62tCqYwkyUbK/GJfc/lBonbPuiQ
	 +d+NIVAYzSMPNg7nBfjM8+KNC6BrRxWd2rs/mTn/Yfe5UPGuLs/5+rCXQVYLHW6/aB
	 80pi1JjzLatvGOxIJ/rJvF9fpjD9Idt5igM0JL7oKKTnNpFoltR4hj5HzItHyUh9sd
	 lLSpdH2zzHWNQ==
Received: from [192.168.68.112] (203-173-7-89.dyn.iinet.net.au [203.173.7.89])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0F8706B4F1;
	Thu,  7 Nov 2024 07:41:54 +0800 (AWST)
Message-ID: <8e858e760c78ddf533e9e03c20b34fce29862c2e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: catalina: update pdb board cpld
 ioexp linename
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai
	 <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Date: Thu, 07 Nov 2024 10:11:53 +1030
In-Reply-To: <20241106-catalina-cpld-ioexp-update-v1-1-3437bcfcb608@gmail.com>
References: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
	 <20241106-catalina-cpld-ioexp-update-v1-1-3437bcfcb608@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_154204_489517_48F42365 
X-CRM114-Status: UNSURE (   7.20  )
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

On Wed, 2024-11-06 at 16:58 +0800, Potin Lai wrote:
> Update the GPIO linename of each PDB CPLD IO expander based on latest
> CPLD firmware.

What version is the latest CPLD firmware? What was the previous version
with the old pin assignments?

I'm also interested in some discussion of the coordination between CPLD
firmware, the devicetree and the BMC userspace configuration. This
change feels pretty painful.

Andrew


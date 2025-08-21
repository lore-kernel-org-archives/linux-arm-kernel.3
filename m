Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCBCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EibGZd7nyRLcwEweYIonjhAw2DfeXno+5/ZqfPcJsdI=; b=qdBSsYjcTJtQjs
	ASFMOF9H1Gw/b2H23nquOkvLnXK2GfVu7+z4K1LEFg5CPGyAVPsDTds5Puc/qn4HsvLoApHpUCEcs
	LHIpmzPyItFj8YsYc0Cbv8Z4a5Cne5KjYkt1iaaM07arDn+iJhUrewuRg3rMVooE74Waoco130kNL
	Q+ClluOoQy/2PeI3iLNlJCkljEl4cN61hcVy/jsttbNmDLb900vtL7+c3b2B5bbCOPyuQAkmBKrp6
	5IVy3NXNdwI0SoeOWkZGOnIcaE7HXtro8BjOhRat46RxWe3bp6KVljfSb2qdRF8PBDt4Y6cJzreMt
	APp8RX2jZItHvjzFwUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEqr-00000000wuw-3oQ1;
	Thu, 21 Aug 2025 23:37:49 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9tg-000000009i5-3Cxk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1755800409; x=1756405209; i=frank-w@public-files.de;
	bh=EibGZd7nyRLcwEweYIonjhAw2DfeXno+5/ZqfPcJsdI=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y63y1rOdoQRnx+6JG9QXYCw/uEkoun+gdFAHtvO/L/MlwQGjdlamSEOI7dLio9PV
	 2zhKddY0oJT7YuaMZAcLI8NKHewroOSbbMBm9w08/9piC0+23vxMl7jXi9alUsF9d
	 eku03F2q76tCR783QGeRG5E/i/7ehATdfQEgWwwL3SViUIALy0g1iqFBqpsEfMxUt
	 06c8cZYVZuORDMlF7XTusEKUOEZgB06/IA6euCtUF9jcoFGu0AmrS9z+fohH0Zghj
	 Pfj9igsSNxwdSy7vlfDizdVEFlCRsnV6DR2qP0SX6r446vBcwfsxwUtS1fdoS09/A
	 uTFWrEytS5VABak1qQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.85.148]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1vAHF40p2B-00XMxc; Thu, 21
 Aug 2025 20:20:09 +0200
Date: Thu, 21 Aug 2025 20:20:07 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] ARM64: dts: mcbin: fix SATA ports on Macchiatobin
User-Agent: K-9 Mail for Android
In-Reply-To: <aKdgHGElBEyHeP67@shell.armlinux.org.uk>
References: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk> <aKdgHGElBEyHeP67@shell.armlinux.org.uk>
Message-ID: <A598C273-6EEA-4F86-8E5E-A07F80295AA6@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:75Xt+RN91IW5E4jpqr+KBpTLVEF0aF+I9almrxX3jxmyOBsrUe2
 AUPBq61G7LmK0JE7pYyy1DHkzEptDVJl2kEiGtJl3J+rvMaRCXHTPvLIDgNomTQ1daGCGKY
 VF4cZXjMwbRjBmOgUD4CdNp9jRC7y15VSVh1H+S28GK1msGtBwWK1vAHanFDKziN1b10Fy5
 GK2ezEFN4npli9FaT2uvg==
UI-OutboundReport: notjunk:1;M01:P0:lTtVEOu00NY=;Aqp6C1VuUHAcxycnk4QjCMvoUzj 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_112025_176173_97B1544E 
X-CRM114-Status: GOOD (  13.89  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 21=2E August 2025 20:06:20 MESZ schrieb "Russell King (Oracle)" <linux@a=
rmlinux=2Eorg=2Euk>:
>On Thu, Aug 21, 2025 at 06:43:28PM +0100, Russell King (Oracle) wrote:
>> Booting 6=2E16 on the Macchiatobin, I discover that I can no longer
>> access my disks, and thus the userspace boot fails=2E The cause appears
>> to be that one of the SATA controllers doesn't have any ports:
>>=20
>> [    1=2E190312] ahci f4540000=2Esata: supply ahci not found, using dum=
my regulator
>> [    1=2E196255] ahci f4540000=2Esata: supply phy not found, using dumm=
y regulator
>> [    1=2E202026] ahci f4540000=2Esata: No port enabled
>>=20
>> This is as a result of the blamed commit below which added a default
>> disabled status to the =2Edtsi, but didn't properly update the mcbin
>> dtsi file=2E Fix this regression=2E
>>=20
>> Fixes: 30023876aef4 ("arm64: dts: marvell: only enable complete sata no=
des")
>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux=2Eorg=2Euk>
>
>Frank,
>
>I think this is also similarly broken by your patch:
>
>arch/arm64/boot/dts/marvell/armada-8040-db=2Edts
>
>as you've updated the ports on one SATA controller but not the other
>in the same way as you omitted the second controller on mcbin=2E
>
>I'd also question this:
>
>arch/arm64/boot/dts/marvell/cn9132-clearfog=2Edts
>
>as you updated the other cn9132, but not this one which was introduced
>in 6=2E11, and your change was in 6=2E13=2E Please can you look at both o=
f
>these and send appropriate fixes?
>
>Thanks=2E
>

Hi,

I sent it at least twice=2E=2Emaybe this new was added in between=2E
But i have no marvell board for testing so i cannot verify my changes are =
correct=2E
I only tried to fix binding errors=2E
regards Frank


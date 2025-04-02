Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC6AC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XG7JI41gti/kdn3Is26cryBb8EBLnX2ZKGu8HC+PSjM=; b=4pDtqUu+iM70Xn
	gDAydg1Q9A+mPF+KjefvOfeh3NKaeTfg71sPNkqDGR6W9P0bBo2MRCn8v6Rz9yQSuqMhEwDw85Pdp
	0dEnkXGFHvEV+G+vrKbGQJvv0H5kojiph6xIxOWELi0e2lVjjS5JzvL5ryvQdumXFFzyW0mwiseQU
	ew7Nfhy0/rpCM2XYlrZW/yensj85Ped6of6JWJ4pVdSGkzfNBiKb5SfNEDdH3rwZgh3SQinBmmxH/
	x9xrIftybmoU1QmDAdCtXiSu6O4ZFX0JwaqGJWpvsRE06nqpLBR2eMckLWeMlh4dcD11Gh1k15iPm
	qvHCY3hu40zGhB49tnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzpZn-000000055mZ-20XS;
	Wed, 02 Apr 2025 04:19:43 +0000
Received: from vsmx005.tt.xion.oxcs.net ([153.92.124.183] helo=vsmx010.tt.xion.oxcs.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzpY2-000000055ff-1kiX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 04:17:55 +0000
Received: from vsmx001.tt.xion.oxcs.net (unknown [185.27.183.132])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTP id 8BF8CA8173E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Apr 2025 04:17:52 +0000 (UTC)
Received: from proxy-11.proxy.shared.ham.xion.oxcs.net (proxy-11.proxy.shared.ham.xion.oxcs.net [179.190.173.23])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTPA id EDF8CA4019A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Apr 2025 04:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tt.xion.oxcs.net;
	s=mail1; t=1743567472;
	bh=LpNLl1YEN86udcci+d83OFApRmLwfgQJte4C4e+6Gck=;
	h=Reply-To:From:To:Subject:Date:From;
	b=nrXk/okb80XnRyM74JUuokk7bM8IJQQDWKeZRfmRT9c+gir/SKNa0Ejs9coza6ixE
	 sm1Ctq6eHYZ844Z7qlt9uvW0G8nq/rQTaYISARry3/6dqNziYZzJR9DF8yNmsypjVe
	 QXLDgxPIAyPg7eYJdmQaR2BldCqHNgqDWhbV/2SdFVrkOsiCBq93zCf7nRn6wQeNke
	 uTHXFbbWyxLtGMI0OjKDujqxkU76cCfnAQT6C4fy/n7fJII77JZki+nH16XKgvUa9b
	 RACHtQp7wqTtpUnvYbUicLV//5C2O/0kXNldWtUovdM6WomarDcJy5Z9A1ggPQRUx6
	 uq3nCbYTNFSWw==
From: Winston Taylor <ashley16@talktalk.net>
To: linux-arm-kernel@lists.infradead.org
Subject: WTS
Date: 1 Apr 2025 23:17:51 -0500
Message-ID: <20250401231556.1D91321CA918295C@talktalk.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_211754_622758_B89A00D0 
X-CRM114-Status: UNSURE (   3.52  )
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
Reply-To: winstontaylor@theleadingone.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello ,
These are available for sale. If you=E2=80=99re interested in purchasing=20=

these, please email me


brand new and original
Brand New ST8000NM017B  $70 EA
Brand New ST20000NM007D   $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA


CPU  4416+   200pcs/$500

CPU  5418Y    222pcs/$700

8TB 7.2K RPM SATA 6Gbps 512   2500pcs/$80

960GB SSD SATA   600pcs/$30
serial number MTFDDAK960TDS-1AW1ZABDB


 8TB 7.2K RPM SATA 6Gbps 512
  2500pcs/$70 each

=20
SK Hynix 48GB 2RX8 PC5 56008 REO_1010-XT
PH HMCGY8MG8RB227N AA
QTY 239 $50 EACH



Brand New CISCO C9300-48UXM-E
Available 5
$21800 EACH

 

Intel Xeon Gold 5418Y Processors
QTY28 $780 each


Brand New C9200L-48T-4X-E=20=20
$1000 EAC
QTY4

=20


 Brand New N9K-C93108TC-FX-24 Nexus
9300-FX w/ 24p 100M/1/10GT & 6p 40/100G
Available 4
$3000 each

 

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each


Brand new Palit NVIDIA GeForce RTX 5080
GamingPro OC card with full manufacturer
QTY 48 $750 EAC


BRAND NEW - ASUS TUF Gaming GeForce RTX =E2=84=A2 5080 16GB
GDDR7 OC Edition Gaming Graphics Card SEALED
QTY50  $700 EACH


Best Regards,

---------------

300 Laird St, Wilkes-Barre, PA 18702, USA
Mobile: +1 570-616-8251
Email: winstontaylor@theleadingone.net
www.theleadingone.net


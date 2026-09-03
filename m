Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C2C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XD10siGyv2UXcVcAX66uMHAbJieFBJyM178WgyCpFQo=; b=Yl2geC9gjj3RYREdvjdN3riuB4
	c9adMpx+94Lfk8YYTiS0Sq2Y2Bo0k6ArmkwqNryGtfG8yW8W2MLAVhyrga4kbsrSjL/GOXMYGHBki
	HKzc5xWuBBVkVkXQBxjCQCeEdTS/Cqu7zu39HaAppV5J6cYZdypAa0ld/tvQ0vW067JzXCdJakqdQ
	9kGjTzI8vSWMLglCcIoISjJnWxbIV8MLSqIHkNFN+4xAwje35xcurWYorNWMtFanhOfPP/RpiNn5r
	INRr+IWUqhl2hom+GVOFDasrzwgg+5n7TfTmT0G7ZknBK0LVVQA2COYl482XSddfzu7x2mrJv20AW
	qXX4zWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wh-0000000GajN-3afA;
	Thu, 03 Sep 2026 07:33:15 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21wg-0000000GahX-0KH3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:33:15 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2470275a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420793; x=1789025593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XD10siGyv2UXcVcAX66uMHAbJieFBJyM178WgyCpFQo=;
        b=UVKwSs6iDMt4rt8shCBgxBfXKQqX2BwgyWE0ze6ZHshOwqqtJSCwMC2o1Zn/V5+2Fd
         093nvh1fStHYthPEVhnDBox82VeHJbvWG9pdGbs3NNFsAsv4THQdf8IPP98Gtb36LWpy
         hOYystw8TTZ+qs4SzHegdEp5SmTvQZek2t2ImesIVMOPp8I+RM2mNI1tPzqunoOwfmD3
         qnaCpg5NWpp6ufVmhqeBQCXQPXZeFB6YgzrbsaaII0vhJD0+odBbwX0SeKFRP/GM2c3+
         BiFrEMlqPTP3iFd5EytiZjaDh5h2e3v6G/fMzew+lYobBstflJrA/CcJ4NJwM1LvnxR+
         2iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420793; x=1789025593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XD10siGyv2UXcVcAX66uMHAbJieFBJyM178WgyCpFQo=;
        b=bf2fumOPsfWIeuDAYl7IhlB8xd4zvCM4DTL364HDsIQ3Efsh9jIPeQudJdw6q/1KmG
         3AIIEsuv7vXNga6O45SqLt3BiCZlyGzscHtAAkFx/HP6lgVJ0HMc9QMW48GROD5JPwU2
         qd4XFQcOvxFhrEsChFyPHgKjOB8KTFDCBNbxHq5O9J7/1tvXvUhujeWGta1YDFnMyS0/
         E0VQMuVVeBD7gVolYMSAEiLPswZsGw1/0Qn7DqBjG1z7R11bwktqHxcZgdFAPGBAarmE
         z3togcfgcB/PTxo9G9cYGvtu7ZA4wE2SwKdirlxpBIlCk269NAWisi/9qbrH4UwW1xxn
         94bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJKvtEP8XntMFghuRnOQT0zcO8T5iWADHmQeIi42z+k267b8HXR6oZr6vCX0irndfzaNENL8rDQl3HNLJiV665@lists.infradead.org
X-Gm-Message-State: AFuF++mjk+0M8iKkGbPXSwO8F8plJ35gBAJmfcRkOhjN5uWqimVBrB5e
	PHI4Gz9pofw6cITXyqG7GVtu7Ms2aacRE7Ls8dql3cfOLhP5oSWXtyX9
X-Gm-Gg: AYBFou0asxTHOXbVyfIrCmpPFZvRKb0QAswhOTTg+vWnfWPcmopX0PiEwQAdI7GKU7d
	49ZrjHlNQl7SVEW8EtPQtT7KweEG26Jkm59lb6xzw9RsWOk+Z9Sm7t0a3SUIvwdvj9tGgwNx71I
	3MG7A4byjFD8Oob4m2jLuM+n5SJCisswzYxY6HgSS0OMyHFZwsGwMdw387dD4xz2eWYzztYWjms
	Cc1KeAzkGIvxaVdfYXpfeWeAv4a5erdelRpZnUb5DWau9bgKvZw1qv3PiZC0WrpG3xRCq3Qhgr0
	235NaH2spEaacHUYFai9mTB4dh8zgu03XYY9gPhv2Gsw2ZdLmGogcKijGMqNLU35ziw7ySXAaqA
	a71xgoCmHBCeSe7l7VfHj0VGyy3yY0Fhq4GMkJU5lyPfDh/bAmGQ2V/pPcIrA9Kjlb5+bTdw8WF
	ZeVFYZ5YYKbLuJHCvEHa5byH4zRpnKMx6hb4JmVCEHShnivLtPWfs+mo65ZFlWhZLGb0sItM9+c
	Cpj3RBGrWcPfS+vH5KZN+s13sKkdfJzEu7aPC9NaBizXAgR+YOCWExAwe87A9hta52dl+UcsXNU
	oeNQYWJ3CZcajqU=
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr17057325a91.18.1788420792882;
        Thu, 03 Sep 2026 00:33:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v5 0/3] net: xilinx: axienet: Fix IRQ error handling
Date: Thu,  3 Sep 2026 14:32:49 +0700
Message-ID: <20260903073252.339250-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003314_120040_A64EC2D2 
X-CRM114-Status: UNSURE (   9.69  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes IRQ error handling in the Xilinx AXI Ethernet driver

Handle errors from optional IRQ lookup and preserve the original error
codes instead of returning -ENOMEM.

The changes were found by manual code inspection and compile-tested
only.

Link v1 : 
https://lore.kernel.org/all/20260811034715.6034-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20260813042012.17631-1-phucduc.bui@gmail.com/
Link v3 :
https://lore.kernel.org/all/20260817105241.63345-1-phucduc.bui@gmail.com/
Link v4 :
https://lore.kernel.org/all/20260821123249.41527-1-phucduc.bui@gmail.com/

Changes in v2 : 
 - Split one patch from v1 into two patches.
Changes in v3 :
 - Move the lp->eth_irq check below instead of handling it immediately 
   after platform_get_irq_optional()
 - Add error handling for platform_get_irq()
Changes in v4 : 
 - Add Reviewed-by tags
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.

Best regards,
Phuc

bui duc phuc (3):
  net: xilinx: axienet: Propagate errors from optional IRQ lookup
  net: xilinx: axienet: Handle optional IRQ return value correctly
  net: xilinx: axienet: Fix IRQ error handling

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0



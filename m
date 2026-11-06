Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004CD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FO+9otzS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gM1MjWcnGqQlHTA7Do9f7yi6ogS9ecmItrbj0c1PYw8=; b=FO+9otzSy1cQfo
	AW7RhULmmLe07XkR62wyvoCRXkg07AAhjMRZpevnk0SHd9N0/gsX4BPoEU06xvF6yNLYapqAuwFEJ
	z+rWaKw4pXwRHV8bYsfhmEBwt3dZYcOejSUczGG5CGi5JoAC/5wFWn49iCwlSDz2b+ON0pRH5uiR1
	nlWfZiX+Y0ARt0W1L8HRH2ZxW5aJBipI1uXqQdV4+Lo5m2+xo0ubT3j9Z+WemRc4l1jg03kfxWZNE
	C8j3uvUnqZarxw1FbZgIVi9cMG7tJZhI3c670ycbaBzDh6k0Yo/A3S7GHNFURDif9n5YiL/ah4oFj
	VyjhQiVYCz8bE7BMhP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPITH-0000000CCta-2Txo;
	Fri, 06 Nov 2026 11:51:03 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPITC-0000000CCot-39pD;
	Fri, 06 Nov 2026 11:51:02 +0000
Received: from Vostro-3710.. (unknown [14.220.232.26])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53c584876;
	Fri, 6 Nov 2026 19:50:46 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: amadeus@jmu.edu.cn,
	bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Fri,  6 Nov 2026 19:50:40 +0800
Message-Id: <20261106115040.1199269-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
References: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1b0b26f7a03a2kunmdfed847049a20
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGksfVhhJSE8aQhpDQh9PS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUlNWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035058_958712_A49646E9 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

>    (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
>    mapping between the DTS and the schematic, making it harder for
>    anyone tracing the board power.

I didn't mean to change the nodename, but rather aliases.
BTW nodes should be sorted by nodename (placed at the top).

>  ... However, 5V_OUT
>  is a distinct net in the schematic. Keeping the node makes the DT
>  power tree accurately reflect the hardware and clearly documents
>  that both the USB VBUS and HDMI 5V domains share this OR-ed source.

It is not an independent network. 5V_BOOST and 5V_OUT are on the same
VOUT, only separated by a diode. The device tree describes the hardware.
5V_OUT is not a regulator, it has no enable control, so treating it as
a standalone regulator is incorrect.

>  ...  For now, chaining
>    `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
>    representation.

Adding a fake regulator is just a waste of startup time.


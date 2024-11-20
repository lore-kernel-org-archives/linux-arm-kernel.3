Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7420D63934
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSJZ1W57ZoSqqLjkRll8IM+U6gM9hct1Kui4s1a53A8=; b=MTYBxjPlADqcwgWY3MUw2A9Kxn
	3VPzZKLy5v4LveGiY1r1d9Bj6kDIsdb+2qSz8fjXXS1FxbNKg8qNbsEKs4rTP3OD3Pn5BRoGrDY0Q
	Qfih4M7HSd3Ooa1aVYxKAnb5QuM16OEdkBnCT2oFsadX3M/BucLPMUF76wmQArjT1IORswwglFexj
	dRdW8UJ8Jsg6pg6Duvcx1bQdMr2jr/BT8iWOyHU9XsE6E8bzQIN0HuuA4ChTyHqYGyyzhi9SFW5ur
	EnGIq3BFJEPH94ufW9QcZHZK6AG8qQlr4GJVcgsyI3QJWOg8K3WMfWLlyrfVInkXQPnLJYpbtsQzP
	wW1+G4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjlR-0000000FI31-3pw7;
	Wed, 20 Nov 2024 12:24:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjkV-0000000FHwq-3JUX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 12:24:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539ee1acb86so4444483e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732105437; x=1732710237; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uSJZ1W57ZoSqqLjkRll8IM+U6gM9hct1Kui4s1a53A8=;
        b=gzOE5CSF+U2K0iJ5+zN5ye8tsgFKK11TcL9An5R3LD+t1YI+CTYY9O2g7p6n0VbJ/J
         vU9ToANIRCX8umtT/XfXIw08cCkMO0AmUGDvX1BILNn8Opbtll/ZqKwXiTAipPxIOt2h
         n5ohw3kjlt839JZ3PKi+DD/afzETJLn/8MJM06GRqkoZboBjrUlVsGYGdwNv769wWX5i
         D5p8tsj9no+HVSdrjkJBEqE57xQfofDh9Qu21e5U0rIOi35Z1oPwzPccsMgk1A3L4b1D
         6hfitEhm3ICSz3Zf8G771QkhdWGNuuLxfjfqMH55XwYOmDX5qgXaiXkNjSZNAc0RWw5+
         QlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732105437; x=1732710237;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSJZ1W57ZoSqqLjkRll8IM+U6gM9hct1Kui4s1a53A8=;
        b=aZtCViDkOmpTTBwBK2JHTn5qyX1XxowEV2HRdBSJ3145XR3hv6IleVpZxqF6xMNETT
         f5GeT5HuxxnoFTj3EsVSsgXBJYoDgSPCsyVJoZHQLji4PRpij4SLlX22gd5+orevMHnT
         Of4oSJBmq8oxCQgoBML0kR0l/igOO55yLsTGxYKf5wzUngMUpjgjxJezDe6aQeXg1hQd
         fh45jmFAWlWIuWMGQHQMyiqrzU0E2UDBlyU/9jeXbvZV038EWaQTnxENqnDbiwk1Lt4X
         rGq971K6eCfmRRD4T5VimqGchkTCWWQm7c0DZpP6yad7rCSx+sgCnt2GADL4i6fWKVT6
         P+fw==
X-Forwarded-Encrypted: i=1; AJvYcCUu4gSsYw9xiDZmWz+bLCcYfDt5HHb86oF5d8+ux7l5apd/fg+K9YOl1wxvc5VNoMkNYHOf5sQVtpFpJY0c3Myo@lists.infradead.org
X-Gm-Message-State: AOJu0YxcP2So0ymc/iGUfC03fFADXBSH/daVNeQruzkKXlOVYu+GDzsD
	hEbRM7Z9/p1/x6Xi2KGDxfuS5PXBbMvWZZpH4H75KuHqiU4aBp5IfszhdJ9UZDdWr9izpdw1i57
	oJKizToXm0hpaMMLuLKOAPjuKJyI=
X-Google-Smtp-Source: AGHT+IFVT59cAt39hKcNtZJ3C+DXLYo4WgI+/MdcksAV7hj7irjI+FkLqdy6PDn0OPGx1WkXukvaVVEpqspj/GCD304=
X-Received: by 2002:a05:6512:3b2b:b0:539:d22c:37bd with SMTP id
 2adb3069b0e04-53dc1367c32mr1034544e87.36.1732105436947; Wed, 20 Nov 2024
 04:23:56 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 20 Nov 2024 09:23:45 -0300
Message-ID: <CAOMZO5CvorhgM0r0WssdPxu2Q+=QuaLh2m26sekn5TadUip=RQ@mail.gmail.com>
Subject: imx93-evk: Failure to run flexcan loopback
To: Bough Chen <haibo.chen@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, Li Jun <jun.li@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Mathieu Othacehe <m.othacehe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_042359_826586_396EF7F8 
X-CRM114-Status: UNSURE (   7.93  )
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

Hi,

I am running kernel 6.12 on the imx93-11x11-evk board.

I have backported the imx93-11x11-evk flexcan support:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20241120&id=ed73790b6ba7e44b6ca7129dbe564c50a20d9f45

I am trying to run a loopback test:

~# ip link set can0 up type can bitrate 125000 loopback on
~# candump can0 &
~# interface = can0, family = 29, type = 3, proto = 1
[   73.313897] can: controller area network core
[   73.318472] NET: Registered PF_CAN protocol family
[   73.338241] can: raw protocol

~# cansend can0 5A1#11.2233.44556677.88
interface = can0, family = 29, type = 3, proto = 1
~# <0x001> [1] 05
<0x001> [1] 05

but I do not see the eight bytes appearing in the loopback.

This same test worked on an old 6.6 downstream NXP kernel.

Is anyone able to get flexcan working on imx93?

Any ideas?

Thanks,

Fabio Estevam


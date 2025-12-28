Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72F7D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Etm/3G7ScU80cA9b/oZOXsitJWZVjHAgTPG53iNEFVs=; b=z+OwatYc9463fyNTc8m50UQmKg
	O69GH9bBjR+5Q0Kn6+vBqEM2f5R7idUsr+d9UdRW36pEGew7mhlEOddXFHTxuQh2NwSOIV5h98U0g
	040hdIU4hIOvs8kabM3nw6cRywE/NT53LltTI8xpKNDC2tSAvHuqjLOh3EYwX4QY0oo182rMA4Vce
	letB0ejBfivKyDbRZtlTCqM8RaOdnGKx6Tlj3efwNNiQ39rzitlq1VyPrPm1cZhI57ZNMyROwy1gX
	0Zh3u3xvNA9Wwx6JEuKu3s5Y1hMC4774XB4Fas4xAXUhdgtSM430UsbiK2BddPO5iTxLxj/qp3ncm
	oxmJbHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZmQw-00000002bZf-1hJZ;
	Sun, 28 Dec 2025 08:47:26 +0000
Received: from mail-oo1-f70.google.com ([209.85.161.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZmQs-00000002bZH-3IF5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 08:47:24 +0000
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-65cfc52c912so8155373eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 00:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766911641; x=1767516441;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Etm/3G7ScU80cA9b/oZOXsitJWZVjHAgTPG53iNEFVs=;
        b=HEiFFFv3iMbqL7kyFbnzfh/9cFnQxkxJ9Kb5EezJB4YhbYuIfjHdPftuCVt8X0wd8J
         B+vFfkibbg57NAuOXO67IDQXuvoghs0W+nvYJLjekHL8qm3b2Ayqz3tOBdIxQUTgR2y/
         CkNWPRtzoDgSxK18cOorUaC/ZtkZiubnmaiSJXMQWTyIoepSNunU1rjk64O1TMAGklVI
         2C2dHuakkDSAnxUC6qwioOROspou+Iab7ov2SDRfTV4VJePUPYuGVAAKnTbEvGe8ibnW
         nWrAxuL+JmMQM1TaPai/3iIDuvEoT6g3IQmbrMVpPcvHmYVGrXL35eKdghnJZHfm5d7v
         p4FA==
X-Gm-Message-State: AOJu0Yxjld6342v1EoatYeE+EnriuNQS5RCCIj4Cr/ppV6NUpCqp+2qP
	uukMzH21sAZlLVb9COOcZCXhXjziy0MonzB6ImRhMrc+fnOkwVtAWH8Pe99lMD8VHYU4smwRA4v
	NwOc3y1K/CCXFZ4QWHAWu3aIVbbBPRr7djPyh92FkYjw/VnDywR8eRynLiL8=
X-Google-Smtp-Source: AGHT+IFEs9J3bUaLwIQehmTPZZRhDfIPtWi1ZWXXaQC3AgsSh9Oyi+usJxGuWKJqIqREInlFJft8kcTVNyEoqZMG7wsOHiQrCF7e
MIME-Version: 1.0
X-Received: by 2002:a4a:dcc8:0:b0:65d:7e5:d49d with SMTP id
 006d021491bc7-65d0eade78cmr9001829eaf.72.1766911640790; Sun, 28 Dec 2025
 00:47:20 -0800 (PST)
Date: Sun, 28 Dec 2025 00:47:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6950ee98.a70a0220.c527.0009.GAE@google.com>
Subject: [syzbot] Monthly arm report (Dec 2025)
From: syzbot <syzbot+list754a4a62455c8c172e46@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_004722_870968_67D22BCF 
X-CRM114-Status: UNSURE (   3.59  )
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

Hello arm maintainers/developers,

This is a 31-day syzbot report for the arm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/arm

During the period, 0 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 7 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 294     Yes   WARNING in delayed_work_timer_fn
                  https://syzkaller.appspot.com/bug?extid=e13e654d315d4da1277c
<2> 66      Yes   INFO: task hung in truncate_inode_pages_final (2)
                  https://syzkaller.appspot.com/bug?extid=760777ae7038cad77437
<3> 15      Yes   WARNING in fpsimd_restore_current_state
                  https://syzkaller.appspot.com/bug?extid=d4ab35af21e99d07ce67

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


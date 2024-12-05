Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48337E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LOb5bRCTs7fB0tNDMCyTrFEpjY3yj4VUPsI90sOxb2A=; b=jiIK6NI7sQir39kwwSYYuEDhSt
	emb9CZJNUsTuycqh0GtvySXeeveGmE12wmPoc9/P4pSpD2gFagge2G3J9pgLFa7Prq4HFn/axxmk7
	vfuLwBNtn3Q9sVdq8e2JuF+f6Gl8+zE2/QmjZTp6V50O8MfZhEYD16G2tyuoNka3+povlA08yA39C
	gFcSdQIS/svbxUlj89X70ZQVqsssfxWRR0hLRXaX1ClgZYWIxNN11ua3Q4QjPmnSVoPvB7IkwXxos
	jQ3IIpq8r20MosC0wGODkVsIkYhx87GPym1ozNbfURRf4Zfi4YdOeHFosuIFTdz+W3nuWUq1UN2fw
	JFvm8t1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7rx-0000000FIpD-2fu2;
	Thu, 05 Dec 2024 09:09:57 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7qX-0000000FIPA-19Fu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:08:30 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a78589df29so4807785ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733389707; x=1733994507;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOb5bRCTs7fB0tNDMCyTrFEpjY3yj4VUPsI90sOxb2A=;
        b=XX7jWLlVUNz39NBTat3blckegNjU0q4HcS5Ho5NRr2oQ9oSFWLdIJvfOJsDS9CKtzV
         JpfldUnDzR5ONx5TrpwzsGsdXRmnxxcnulw3+PgA8cXoF1a1NiAt7sWopE/dfteFcQjv
         yBJshuc6T95QTgyUGY4TaDJxdhITw/iXR+kOOs0dbKXO1Zqzsc6Jux/TIIteE0IiMHBq
         9bNTdQ+9CdsyW6o9PqEFGK2Nh/Uu5UcmQpalh+ZLQ2/Nmfe8pP9ueIinbBB3rg5gFI5v
         7c4L2SnzX+RQz9wZPWbjDLZzr0AhspQsDEVY1ATWX4eyKKcY22QJQiY6WuX9G8mWUVZn
         w4Kw==
X-Gm-Message-State: AOJu0YyS90BZIBJzHMCbmukBPK6xfSVsnxrTpYf1pUDY9tsRB5Wyth6G
	faIOCbH+a+CKTEPee8OU/k4vKN/kyZVBTWjoY0QM7wbyoEXchTYZKsMlRJF2DGZy3UWbbkx0dLl
	wb71tZFBkbWma1IYnVI7+GuM5Qc4paDi9WMtdySZ6XW5k7nfGJgIIy/g=
X-Google-Smtp-Source: AGHT+IGFvIah2BIE67hHqF9MlPPOwhy/w8UaViJ0teMog5nkys7YJXsLbRsV5l6JsV1JrUo7cTM2I2RjWjCRULRGGSwntd5zJKkB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164f:b0:3a6:ac4e:264a with SMTP id
 e9e14a558f8ab-3a7f9a46431mr112676745ab.10.1733389707494; Thu, 05 Dec 2024
 01:08:27 -0800 (PST)
Date: Thu, 05 Dec 2024 01:08:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67516d8b.050a0220.17bd51.0092.GAE@google.com>
Subject: [syzbot] Monthly arm report (Dec 2024)
From: syzbot <syzbot+list5853008af9f104a9355f@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_010829_309794_D26F21EB 
X-CRM114-Status: UNSURE (   4.79  )
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
In total, 5 issues are still open and 5 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3448    Yes   BUG: bad usercopy in fpa_set
                  https://syzkaller.appspot.com/bug?extid=cb76c2983557a07cdb14
<2> 817     Yes   BUG: unable to handle kernel paging request in trans_pgd_create_copy
                  https://syzkaller.appspot.com/bug?extid=2d1f5a94167d430a3bd7
<3> 123     No    WARNING in delayed_work_timer_fn
                  https://syzkaller.appspot.com/bug?extid=e13e654d315d4da1277c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


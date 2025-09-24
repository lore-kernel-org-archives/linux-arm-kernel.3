Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07909CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=igFS+SRzf9Z12WxHY7Jm6XPcHS03o4aQgk2xq1X3WF4=; b=zEsY9EXR0GA1GllPjbxdAuOEwW
	BhC3Rn+U0aXtTByj8DfDq1+QZ1kvUYVhPqlnt4zRFPKoKtMprw49OK+dG9XwWvxP54kn9LE8S9pj5
	SZrbKRD2UXNqw5BzXf4YVyCKHuJn/o0sV4Ygn/AtUENtVKUMjhdx7H73uhh/18ZtGgDAJ8Ms5vtws
	F1rM4Gm4tQL4UAXeDEZqIaTb/Nr6GGTadD3cfoUZ8xxhIW4fUKBd2IOoAerJuLPXn27CWTnsoxWo9
	TKA80TVKCrji6cGcwsAM7mK6VZr6S3oc2g0HLZwB/o1MPln2SvVgtcP593kciOP5oxJvby26gtamo
	jBoKipSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OmZ-0000000HSzx-0rjV;
	Wed, 24 Sep 2025 12:39:39 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OmW-0000000HSzJ-3RJq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:39:38 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-42591c9fca7so4348585ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758717575; x=1759322375;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igFS+SRzf9Z12WxHY7Jm6XPcHS03o4aQgk2xq1X3WF4=;
        b=bSACJvrJY3JNPDqcItKYHo079svgqtBY7tAFA6SeJiH7aBBsRUFoyuiDMpUuf4X/Sz
         5bf5B/d8bIzL6PKukCIdxc6HERrz8wPGrHf8+2j7TGWlsjs4EEGmA/cNNrio74GV4fHI
         mDuSuKQqtTRhZSx+ToJbKcDXOUhRoCYuajhkz4mGNbYNVaUsbKvq9UX5T46mOZoVg36r
         73ebCq3dO8UfiiWVztYpzcAWOeN2Ywy6rO2Na+Tbn7KYFp48uoS+LlZYT9g8ah8cArZk
         olE7932ZJ3kGpNAbIlWFY/yb6m3j///Jw0AmU7yI4Y6yxrusRnrD+kcN9MawnMKCIdrF
         XohQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSn3zxIlWlu2Nos/Bri0rViJXoWvImjE0cPcINzIrmIqbyvF74AheXJQgDmYGASPA5ySUsqLiX4mC6HNMcNpj9@lists.infradead.org
X-Gm-Message-State: AOJu0YxRkM6c2bkSnHNViVm3FMqU6UOUphrGO4ED+Uo107kbCn1VZbnC
	+Nlv2jyO5iv5fTrL0LeqhUBpqM36T/+h5ZqGMqJZRL3cXHgB5M0o0plXH2IxwQns3rTQLNrF2bu
	slG4CFb1R+Waqbf4ZvpErvRhPp2YfJsRtEae85OmZJU8mJGfQwGoO9tMTg5E=
X-Google-Smtp-Source: AGHT+IHAw9v7k4lEmXT0RSpYDbkepjZ8o/GpwTKFQKjV1xNTesT+/FGryWRKD/sPKGDWYJTBXqKQZBHHSYUAhQuhOpZgib1r6rGz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2184:b0:423:fb44:e8d4 with SMTP id
 e9e14a558f8ab-42581e0df9bmr97795075ab.6.1758717575140; Wed, 24 Sep 2025
 05:39:35 -0700 (PDT)
Date: Wed, 24 Sep 2025 05:39:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d3e687.a70a0220.4f78.0025.GAE@google.com>
Subject: [syzbot] Monthly kvmarm report (Sep 2025)
From: syzbot <syzbot+list12018f178486b71446df@syzkaller.appspotmail.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_053936_861347_80111204 
X-CRM114-Status: UNSURE (   5.35  )
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

Hello kvmarm maintainers/developers,

This is a 31-day syzbot report for the kvmarm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kvmarm

During the period, 3 new issues were detected and 1 were fixed.
In total, 4 issues are still open and 6 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 6087    Yes   kernel panic: Unhandled exception
                  https://syzkaller.appspot.com/bug?extid=d173b3985bd6b9487fa1
<2> 441     Yes   KASAN: invalid-access Read in __kvm_pgtable_walk
                  https://syzkaller.appspot.com/bug?extid=31156cb24a340d8e2c05
<3> 10      Yes   BUG: unable to handle kernel paging request in vgic_its_save_tables_v0
                  https://syzkaller.appspot.com/bug?extid=4ebd710a879482a93f8f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


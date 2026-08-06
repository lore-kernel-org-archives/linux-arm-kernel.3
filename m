Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA90BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imv49H40T0imiJVvA5Q+dNmyVovxOuHkUmfa3LQqk7M=; b=JAh6HLRfdjcdnzVENRIDFwk1rV
	m7NUJM4P5XZ4cHIkZqrEuzOj3+stWUCmVqUaAQh3dwExY2Ts+3iH1Q0VBIN03FzcLw7FInkxEs8UN
	EgAp1xmwWbsub/qmMO3VUNo+dgBmKzLBfeaqWVKFGo1dLSuS6ZyYJJY5q18o+VtKi5snn7j4pgCFA
	hLIAsk+t0oIHuBxgtUKlBi0L2ZIoUSh0VAH5DwU/g7yClLK2GGBVU5uRt5WQ1TqROipLCSDCKG3LL
	60aZetdCA/ys6OsNzvjQRik4vEHKxNkTV8RQGtCODr9kxjtsw+h6qeDhRG98GEZusTD5ufMgcB5jm
	xw03XIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrz62-00000005ysr-2PMl;
	Thu, 06 Aug 2026 14:29:22 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrz5z-00000005yqx-2Cze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 14:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786026550;
	bh=Imv49H40T0imiJVvA5Q+dNmyVovxOuHkUmfa3LQqk7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eBQa4fXaZ/6cO6CxqAyQxP+q4iDPetPuo+2+oyOftUzBDq439TQP0IC7uKEj/wvkI
	 VNF1aQQU8KaZZriO+eMdYv5GduKEC5nUJX06HDpRrST+aS6KqYZYygvfojkDHDISEb
	 XG51Zs2xFT/NoEzCbST2BoWu0K3/X81ZKt6v5MLg=
Received: from LAPTOP-JJ91J38E.localdomain ([222.125.130.218])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 748356F9; Thu, 06 Aug 2026 22:29:08 +0800
X-QQ-mid: xmsmtpt1786026548tsmliq47h
Message-ID: <tencent_EB65B78E967A5FF9DD2A591A86A6BD5B1107@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJxH88aSLvsUB8t2+Q6jLrWVYFcYkO53eDw7PcGWqVicODoTZS6q
	 S8dR2Y0FhxrwlZJlljKYEbO/UOj6rRARVQLTCWxWDr13LHBES5XRD3wb53CP6xDjAyULryaJnoat
	 bY+KmrquEITnPedjoolbb4OKO8J/5gk/WqNOeAvgSn8A3dZsY0V2Os1e/eqoLgSlHSglgjLRaHR9
	 dcSrMN2ciT5OAR3KP/mF3PWH3MzImuuiy7fJOlZ1/0NQdPyzrsJZOv+m5lKMtCoK3e3XKNp3KXJN
	 2zUw1JyN/behvw/eIPDH1btZG8m7/khPHd1XNQue93naPOmOmbDJKHpdHfOqCUYWNk0qEXgWkymf
	 nLdDxpZbzIOXu1XXZBMgUmlrOPKhK215VYj2M1d4L/wo1YxDIfeeW9H+c3EDMXThn2TP23zreYHr
	 aIw3+ZchyAuialvzobuKNR3C/QHDqElz8DUWuej31J9IpSyjQlClb1NY/dypOvgt60zP9zaOaqpv
	 wMTk5XLWtI7Yno08zkqLHQfJxKg39lvr6UN3kTyJ9LgCHc1wP2A4xcX8vq/pcvVbErc7FHzmwdwh
	 sojJm0mzmJC2FGJn8Itu9CPwWJzK0p4JOoxy4iRNJFHXKS3ulgto7V1trrwcDt970RwFD0AbWTOO
	 xc1rlJsN8b0VJNK27vLEGv0mTP729S4+/Wd99cDRr8XImsRbyoqR6QC61M+ayteGoux/3VFMejIk
	 EEgKSK9p9/v1um/T+qLR60UCiqDQuVox1Tu4oH4Ax3GRxKTjitQQW/gaeE7ulj0t2OMBGWCSkPaC
	 iPhd0+AFZ10Zo/UoNZHHR17sxodZzqSLGzm7af+BWBT4FGAsbDV1JVWJV5ONcJ0VZHGQ0Hq/myWB
	 u41bhcMHyzv1zxqiWTWFF+e5KyytwWeBOtWJmvS4yrUQwQxVoBJBbXbO2lRV9zCf2/g+BDlPkkEQ
	 AqBBIlVkwYgCgYRBNjUbK9i1wsVinIonu+GCLjzFzHePbPRyv+ae7USNstD+N9IhMtUk2BvSmogx
	 2OhG6HOyLaQveYaoGc6jLImcdLBXY5O7VNA66J6ntc+CRCweY3X+k61drtt5Y=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiao Junzhe <egg12138@foxmail.com>
To: xieyuanbin1@huawei.com
Cc: linux@armlinux.org.uk,
	jpoimboe@kernel.org,
	pmladek@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: module.lds: fix unwind metadata for merged .text sections
Date: Thu,  6 Aug 2026 22:29:03 +0800
X-OQ-MSGID: <20260806142903.2601608-1-egg12138@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806130212.48727-1-xieyuanbin1@huawei.com>
References: <20260806130212.48727-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_072919_882010_E0F8F3FC 
X-CRM114-Status: UNSURE (   7.92  )
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

Thanks for the suggestion.=0D
=0D
I had already noticed before that the current GNU binutils does not generat=
e=0D
.ARM.exidx.text or .ARM.extab.text for the plain .text section.=0D
=0D
GNU as special-cases an exact .text section name in=0D
start_unwind_section():=0D
=0D
    text_name =3D segment_name(text_seg);=0D
=0D
    if (streq(text_name, ".text"))=0D
        text_name =3D "";=0D
=0D
And after your reply, I checked LLVM founding it does the same in ARMELFStr=
eamer::SwitchToEHSection():=0D
=0D
    StringRef FnSecName(FnSection.getName());=0D
    SmallString<128> EHSecName(Prefix);=0D
=0D
    if (FnSecName !=3D ".text")=0D
        EHSecName +=3D FnSecName;=0D
=0D
So, with both current implementations, the mapping is:=0D
=0D
    .text       -> .ARM.exidx / .ARM.extab=0D
    .text.foo   -> .ARM.exidx.text.foo / .ARM.extab.text.foo=0D
=0D
It's correct that .ARM.exidx.text and .ARM.extab.text are therefore not=0D
generated by the current GNU or LLVM implementations currently.=0D
=0D
My reason for including the exact matches is slightly different.=0D
AAELF32 defines these section namespaces as .ARM.exidx* and=0D
.ARM.extab*; it does not require all ABI-conforming object producers to=0D
use the same naming convention as GNU as and LLVM.=0D
=0D
For example, another producer or future version of GNU/LLVM impl for `as` =
=0D
could validly use:=0D
=0D
    .text -> .ARM.exidx.text=0D
=0D
And our topic is about text section merging in ARM32 unwind section layout.=
=0D
=0D
Without the exact match, .ARM.exidx.text would be left as an orphan=0D
output section, while .ARM.exidx.text.* inputs would be folded into=0D
.ARM.exidx. Since the corresponding .text and .text.* inputs are all=0D
folded into the final .text output section, this would make the unwind=0D
section semantics a little bit asymmetric.=0D
=0D
That is my point why prefer to keep `.ARM.exidx.text` matching.=0D
Hear what the other reviewers' comments.=0D



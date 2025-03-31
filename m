Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rb5MbgBhl/LXYKGwpqa+Xon91y55iJLtR9YQGBjHd4=; b=reVDZKXQMljXuO+u+rVdEUzsY6
	rOXF3VN5Q6FGUp4xoWN8Ns3BEyoQSsd68GxKNUyHJRBY0qLo31zuPA3cqCXlyUQLtVmAC3s1fL3ti
	9QhLiLEaPlCppHHeWSnPz+kbSjeRNdj/dI+CXCQEJoaT2ebzhW1AoZweDTC4giUafvAAh59yJcsYh
	Pr6y6JfzuSiw3dHrUg+3pEm4oGZxgAXVGCbb5qRE6dQTnncow4Jq60gJmW64GG8jnyolYd2mb9O2R
	hXuw6f/Xmyjegcs1AualQdjOR12KRS3gV5Sxjm1CosJVHxKETG6wQSiSJx83zCjqHLAbsJDSDmFQI
	vMj3EhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAbT-0000000HOkr-2tiY;
	Mon, 31 Mar 2025 08:34:43 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAZj-0000000HOJO-23YZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743409966; bh=2Rb5MbgBhl/LXYKGwpqa+Xon91y55iJLtR9YQGBjHd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rgQM1/oQ0lA6x6FoJGWHF0SSMYOf7Dkw8qV45caWweHwFmdNUQc6Mr+lgCBZ0gqJ5
	 osWOfqZg+Pw7lI+RlJ1bS52jjg8uKPkjmt6vPO+F5stm9Lnd/Zyybx6sQE0IF3D5FO
	 kKZvsQ2mCjPY29/0hbUbW0OjImlCjdhp6IxId9vo=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 7FA17EC8; Mon, 31 Mar 2025 16:31:58 +0800
X-QQ-mid: xmsmtpt1743409918t6ehpvlig
Message-ID: <tencent_5D89C06E5AA49E40EB8FBFAA6796F6891F07@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoCWsrF4NZy6wGXVRiNjjTZ7AdzGQKAKdUU27Vh+8v4n1OqnfDdE
	 KK4uy5K/V3dc5LbAvtD3geMvhRosrX1VzhLp8/oxZX0vOBhKJgGu3ayqeRkk9X7NdQOKOf61A8LJ
	 EViV9mSi9cN6JVIzUeljxFdAcb2ta4ZlG5lBf+0zP410v/a3xmd6auxybeBAwCQpQytUpMoTxOYo
	 8r/oCwQmwT+WtcAmBN1PNYG0kD0mrl8GuZnKY+xTqs9Y+qBnUDK93FDstbtXteMAF+SKk+LQmgJ5
	 YALvAI3nqYEhC5drR6aZL5rqfJaqPdozYfR+Y3PCrqV0RLDebIDeYsx+8MZB6R/eym8M5YZs05Nx
	 enSAN3mAQZhIpk+0rtukDpKQKAW26cXVoV4HARLzFWL4/0eZY82gcHGa+ztB2NCeLAudCp20npPg
	 ++ZpMi55c8N3TQ+JfHzK06XAHgA2uvnbGma5UBgq0mjGHdRb/2oe5gsSv9xIMW3UGJyL4oS1PWPV
	 3pvrt3GOA41dJ4PJNIUf7JmpXneeVQaZvPN296du8hOgOJ9FJ/r6I0JW2IuwESyEepVG5GUfuf69
	 AP7RpxQdFxQPI9wmH9x3j+5njp2RjbLUf4LGim90XCchleDb8UEFWRa0kjO8C+drK4RzqaLykPZV
	 JoHyx49djdQ7yH+jSv986bFI/QLRoT9Nqxl+Ul7zZ14mErPJfwe9G/kKVZ90ho8Cv3cIpGsiB07L
	 zDvM53bp5CZgyfz0b0ukKjIjh0g5dBXji5yjxUd0NTM9nQBY/UhCT94KJfyDsyuH6Bsysevdcvxb
	 yiNl10XMHEj9o0meY+V6Badun17+4202nUtxcdpQxNc+DG/LcHuweVvjA5lapHhOsHo6rUiYQcpH
	 HndSC2YrN9LgLQtoXPpUpZKlGlKQspDcE8xT3+okeOUCdgTt029PHP7UqyFmxIQ5R3zVlc0Pcsn9
	 KKtzpVOAzUMCeeNWO0ro36Qi2w82Iv35MXo2/pdkJ4/eKq7yWCO4PO96TcRcow
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: linux@armlinux.org.uk
Cc: Yeking@red54.com,
	andrea.porta@suse.com,
	ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	will@kernel.org
Subject: Re: Re: [PATCH] ARM64: Add back and fix support for CMDLINE_EXTEND
Date: Mon, 31 Mar 2025 08:31:55 +0000
X-OQ-MSGID: <20250331083155.120735-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z-aWdil-GWFC3c-y@shell.armlinux.org.uk>
References: <Z-aWdil-GWFC3c-y@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_013256_090623_1504B103 
X-CRM114-Status: UNSURE (   7.32  )
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

> This breaks the ability for the user (via the boot loader) to override
> built-in arguments.

How does a non-default configuration break the ability you're talking about? If
you insist, why not remove the non-default CMDLINE_FORCE as well?



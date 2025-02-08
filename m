Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A511C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5p7UqoybweLMCHrgO5RWb9uhO49oo5au53PPusRemc=; b=LsY1IgpWrTwLDX5eXhfO04H9Ie
	Ubp/6K9Zkk4WsaV0QJiFdsAN+n1kd2lXKQIm2iV+TnmKBGMoxHT7oqYqiruvyyiijuuJwykw4TLdV
	+MsJ+FAXIhe/W1w2YXQr9AnL7hkrmHhc1vIma/yqI24hGQXXBq7x960VczordwMLuyIV09aSaKnin
	wRWczTg2l7qiZHsSqJXE6S6qOvkie9JoPo0FM09fIJxwo1wL2vVbtYP3/vuHh7hcS2bmfc5wh3GOM
	F/iVmDr2kFGC//bu7wo1Z8gk94gv8G03DMz28ErLgviIjthHe0jhOjlxPJvz4SZsf52yf58I/5rW4
	JEPm4PGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tghTp-0000000Cfk6-2UXU;
	Sat, 08 Feb 2025 09:50:29 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tghSQ-0000000CfXV-33mi;
	Sat, 08 Feb 2025 09:49:04 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e5b41ee3065so1956875276.2;
        Sat, 08 Feb 2025 01:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739008141; x=1739612941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5p7UqoybweLMCHrgO5RWb9uhO49oo5au53PPusRemc=;
        b=GFNz8WePTwiobWlNXooSx2zlKXd4e/mSQq+owYptcY9PEjQeQqjyeryL1UYVklGei9
         zk1zvXsR+PlgeLclw/9zmlYJpNsG3d+plLXZLkrHUwRKGx0PN0xgCsmxqdL0ud+0pZSK
         PxB1hc7kw8bC34eajmQrwa8eHWjzZx5f0kXzFaHuPlOVRmUapa3I7CD5aSoXMmN1cvgs
         98GKUrSqT68d9W5S5dGVZCtL2E/xHfxPHeNj9jbX1UzLhPNjs9JpYvOz1GWBh3YhIu83
         teP9RahPsb67hpxJxqKGLCajq6586WRD87JIdFkNZ3t+glH2Mpp2xVTxVLkfYj5sjpdO
         ldBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739008141; x=1739612941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5p7UqoybweLMCHrgO5RWb9uhO49oo5au53PPusRemc=;
        b=A3uRVBvwgAsumvVk1wVkTqALZsodwaJMTKv92FSgoul2Y/Usk3FG3QlqDO+X1Vq51z
         lT8DxqpBE2MQ8nprea01KNkiSEWZPM5CcgYsTLJOVFJ8qQ7rl5qrJJ78oAtP8OHhqzzn
         znCZOfMpIEvguctManGxvGZUEQXcMvTEI/Cg4EmZtCqSz4rrq5YZjrHuAQXErBlom/jF
         pPmbKMJi/3FqcLCQKHeXT2V+0d3MB1NvpuqL47X1cqvEaC5fM0f3KjLo7GCxpwMFUH+U
         KMNN1fnZo7b7aAor9P4g9jA4ZUSxvkOZcWOnP3ROK6gEhkDReGFjXIGMUQ1gGzQvkLYM
         Zp4g==
X-Forwarded-Encrypted: i=1; AJvYcCU59qIyhuVray6K/eeI9LDYxQ+d3RFvaKBMplNpjgJltUk3pA82qz/gy7aCA0CYggl61eSa2Vn3xdDD7zEh4R5y@lists.infradead.org, AJvYcCWmNUhH7FZAZIMzvqqccomc3vajWpqZdM1lXinKaRZDNS4LAFXR8z96s+A89gMf1JdnAFknebzSz0Rof1pP2wI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBfu06lwFDK2JJ1HuAPBPielUaxv89V5vIEXRC4kAWr0KaPiPZ
	ayzkBRO+pTpOcooxB5ejL+nMPLcDJAc2GyM/+91fBLcRaROSpPc9UfFo4QhVgwqVvcdX3uavx0N
	xcep5Peexreambvefd7FDtbp5w20=
X-Gm-Gg: ASbGncvUxAV/McB0Bp6Ms3WHtAybTfCufi0Lyu3tT6fmS5lOEquhyLPPZSHdWUw69iT
	pfOc4WNSEVbCubVmJALuvUZYDVhCyxdlvW3F4SQdZ/PygCXgAbKD7nSTzZNFed73TrwarURY=
X-Google-Smtp-Source: AGHT+IGL/r9sSy0VTJwTsdfd7MnGDjOx5Ft+6tXZasVmTF54BlhZsohSuuTPVone9yTxIGPg4Fdsp7fijD1fPAOYYFE=
X-Received: by 2002:a05:6902:2009:b0:e5b:44a4:73c2 with SMTP id
 3f1490d57ef6-e5b4626dcf9mr5240031276.30.1739008141332; Sat, 08 Feb 2025
 01:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20250208092732.3136629-1-dqfext@gmail.com> <Z6ckCZpOo1_rvmh6@shell.armlinux.org.uk>
In-Reply-To: <Z6ckCZpOo1_rvmh6@shell.armlinux.org.uk>
From: Qingfang Deng <dqfext@gmail.com>
Date: Sat, 8 Feb 2025 17:48:46 +0800
X-Gm-Features: AWEUYZkhN2-wdzMWfL2150Js1S731p6ZrWSd5aj0RG5Eny-Vqw6NO7hfNSQzKGw
Message-ID: <CALW65jYG3vv9aCY_HDU4Wyij1kqfiOVOsZ3YnvioUf4AgSbnaw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: mediatek: add ethtool EEE callbacks
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_014902_768770_AE9C650D 
X-CRM114-Status: UNSURE (   8.50  )
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

On Sat, Feb 8, 2025 at 5:29=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sat, Feb 08, 2025 at 05:27:32PM +0800, Qingfang Deng wrote:
> > Allow users to adjust the EEE settings of an attached PHY.
>
> Why do you need to do this? Does the MAC support EEE?

Yes, the MAC supports EEE.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


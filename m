Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UoLqPJz+BVnnu2pZ/H+yolFKvZxInzCZIkRhDZ6aJs=; b=gNiyNlHsnvdZpbYe3gbH7PCnAW
	zce23YiKpdLFNgGBG07iMXfKM93ZtkfuxItdZjwykuQCDL3NKtrAIaPdweqnkETrpVoqSpsD/hUk6
	B34Q8U6pmf7x8kBGtHwJayFLoqq2ulFAsq0GGYNEi7TlNFsQukOqXyfkzSBqMwwEuYxKY5P+d/v1T
	573nqGMTCEgLGiJHH5IRYI4Lf33ihxMY2SySG+lbyA8kLPctrCoOERkLdFMo5B5ZbRDHNXKt1VtEY
	FGRvagU8gT+zvAPjl/Of0yG6dsWu+lLj3Nb3PotINoDBgYRrRgMTKrbxAZPStnt2S0v3KKxNZn09b
	dEiVMtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPovq-0000000EX6N-3ozM;
	Thu, 12 Jun 2025 20:53:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPosE-0000000EWrM-3KPH;
	Thu, 12 Jun 2025 20:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2UoLqPJz+BVnnu2pZ/H+yolFKvZxInzCZIkRhDZ6aJs=; b=MnOn7UpCUHLmkLoGKQkM1LYp/J
	8uTWiXXY0apSQkrUQKiKu6X0L1hRdKp9aeQ39K/ylHiXfhekRXUKwgKW0aBkkAjzotQ1EYfxizsAl
	QPi6TUtPPI7okS5LGDiYiE4hmgk2MIEa2vW3jZF5fgS6pooaR/W2cLGb2gfXxw8xqZsd2XFcdSpYk
	Jyd+nkmMyiN71hIU44gjV77gKAX78sdP4olTFg5v8KXsA0YFuWLFZxt0wT24xqq8h2H/gn6wOAmOX
	e0stihEWPAVrH93QGtAv8mVMnKD3WcU2fREQCDJDzojwoZuSpD0A+k6iWxtW2mTFq/c9RqLsA3Xvt
	NbqcgFeg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPosC-00000002hAj-2W2b;
	Thu, 12 Jun 2025 20:50:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23508d30142so17628915ad.0;
        Thu, 12 Jun 2025 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749761404; x=1750366204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2UoLqPJz+BVnnu2pZ/H+yolFKvZxInzCZIkRhDZ6aJs=;
        b=TjSR1LQRKUw6j4EJaQifizsA7vi7pG3rznmTCzVIRSI7XCr80dJA4z+1Qwkh9r/3/S
         oK74Z3rd8WuC5QZA+9aIbz5auUZq0r65mPAd4UjD2yzUnJQtvzF0qFrJni910XL4xnWI
         0FNBLZF0xqGfcNLJVWa4b8qgbcrGMsPk/1VKBxVdVJxYzcwlmQ208SWVL1eJ6VTd+u29
         oxzi3e4uY6GHBW2lGvFRnPpH0hMKGt5/mQvKfuXSUjO/ZHU6/z92ZaFqvglymBvzHl7U
         LQZAM4DOLJhGn58Ng4Bt48D4jjQr/vaHIDYlt+mdXusU9X5FJ6hilxKDiO9KQ2Z2bx1H
         ae5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749761404; x=1750366204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UoLqPJz+BVnnu2pZ/H+yolFKvZxInzCZIkRhDZ6aJs=;
        b=PTLH/cyR9hbprZnma4AhRbTFZv2L75LddXeGt5K4/MxvKtneXUhmcTrb2rm8795jfw
         KuDifNqUyjTADjSR4EMQX8y6Wy1Q+jLbk+t/f3d6uMP168xBuPjWFIkoLC7bie48F2sW
         j2Kzol/N0w7uia6zkLZgTKLuK6bStdQOCuDOsuoLME25t6x/1qmLM1gNW4/UBhP99wJJ
         1A9QegzoMHGimpJnvmv+fbruk9lVivpMQsLw9vxUbRrYYG73gELUVMypXLwlAFUFJobe
         iofqA6IlSrEEQSw3pU0HvYgRaILpw1h7u/OGrgbvFO+NmLA6clKx0Y4aO0/MhV5wYRCm
         ij2g==
X-Forwarded-Encrypted: i=1; AJvYcCU37k1RTrefbYKRLuKxySehCpzr8HpurtU18zlLhEQPnekVjo9hVFuiX1j38HuUSikNFIrLjZVENM8q+tAtIPq7@lists.infradead.org, AJvYcCUWxzxlw/uhGoC+x1nnDv0lWF52WEXVcHAYiJpeNH6aA/+jHntAXIOoowAEAQQA7Pb5RIfgEIOfULDa@lists.infradead.org
X-Gm-Message-State: AOJu0YwmTT3gHqq+pfbrZrONfvAAdR3ttmwYoDbaKU1ZSrnoixXU+FSB
	Pfdv1RZcRI3LBQnCAeUm4SvxMY09NVxZQh/1qkG3QN+tlFWxdLIZoF6y
X-Gm-Gg: ASbGncv5inc6zO5K8Fbb0yQuMlt2klhme6QJi2ZykFNQPmA/hvQvLBXoyo5zCkObiOS
	QxOY6wvmlGCWEN8UF9xCKsbGFMCwhurxUByB6nM2ZHDqPIRL1OAHHmEqmEXLzMsA6oNLR9GeHLS
	s7yrClYkWp1MKzMa0/WHQ0wUXlRltQeEA/7iXmOkHDX3a59+XtfS3v7+KnUHH7nn3ulpHZrLBQC
	YT22WFJon9b7+cezsauRsg8LFcw6GtgYBgVV1JY8Xnq8hqsT2I/ijLZgJmtXtgrvIc2E/Wrl4RP
	xIkz5UlIHwf8N/ufSmWee7I3fKjx/b2m9agjKfQ2DewV8/rkAQ==
X-Google-Smtp-Source: AGHT+IG+khSNpIZ1lLheFLw/LHPdBlZ34dCXBeuy237kfv8em5EfwIdvXLjGbIw5JRwoxwzkTzKMoQ==
X-Received: by 2002:a17:903:41cf:b0:234:9092:9dda with SMTP id d9443c01a7336-2365da07967mr7032275ad.24.1749761403815;
        Thu, 12 Jun 2025 13:50:03 -0700 (PDT)
Received: from geday ([2804:7f2:800b:725c::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bfe4sm1670705ad.18.2025.06.12.13.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:50:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:49:57 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/4] PCI: pcie-rockchip: add Link Control and
 Status Register 2
Message-ID: <aEs9daeceXkePg7y@geday>
References: <28ae3286f3217881ae6ea3aecad47ae4567d6ec7.1749588810.git.geraldogabriel@gmail.com>
 <20250611194259.GA825364@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611194259.GA825364@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_215008_875208_88CCDF98 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, Jun 11, 2025 at 02:42:59PM -0500, Bjorn Helgaas wrote:
> I would do a pure conversion patch of the existing #defines.  Then I
> suspect you wouldn't need a patch to add the Link 2 registers at all
> because you could just use the #defines from pci_regs.h.

Hi Bjorn,

I've hit roadblock, maybe you can help?

PCIE_RC_CONFIG_DCR_CSPL_LIMIT is defined as 0xff...

I'd like to kill that define too, since it will be
orphaned.

But hardcoding 0xff seems like illegible solution.

Perhaps there is another standard define that
maps to 0xff that I can use? Anyone comes
to your mind?

Thanks!
Geraldo Nascimento


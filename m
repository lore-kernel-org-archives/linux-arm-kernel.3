Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCAAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 03:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8yYHt/qUGB7zSsH1QYJ0433S7HWdvxYqg3YPVEOlQg=; b=xJ5SaQZiXPXVgjiGX0oy+/VQaz
	VYoglR4/JoQpxQRHF5RMv3cXUShB3Wn7IYB1fZflWZ+Ttl/xvAOFNtPRqFwzPOyTY/7E7I3vDcbas
	1mqxx7kCm4rNAOHyUNDrLyrWyus+98ZQ96AY1G1q2IgDbvrzVDwPyJxsnKjymbxq23vu2nYPsEltW
	fGRTPDGS8hZ9BcIBeZULBSZ/C7O5FFjgfGzgNI45DlGR0wjRpQMlXTEr6SKLfqOuPAXqXoSnSYzeC
	A9DURWMMVUc5dp/zx0v+711KnvtLJwIXYkjN0Ltz4IiAVjYF+pvxx2vD1fPtrjt+b//6e932s//hs
	eLnGxk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9F64-00000004Q4j-3xQ8;
	Mon, 28 Apr 2025 03:23:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9F48-00000004Pu7-11Ig;
	Mon, 28 Apr 2025 03:21:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3435496b3a.1;
        Sun, 27 Apr 2025 20:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745810515; x=1746415315; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W8yYHt/qUGB7zSsH1QYJ0433S7HWdvxYqg3YPVEOlQg=;
        b=D3yjsBwmJ6DQ+4VOic1LIl+lrar7OybZlHEKSgcrfir5OYYNqNPq27m7yOoSteJPqh
         x0piUiPIyvbPIVSWYV5m442KL9gS4IDtis50jOJcbmE+6+ONMTNvzGuunnl8Vck08Krs
         innFFCTuxhVja1YNBn//dS/tHfCdN/3DKVkTHrRfie5sAql4MdFMLyKU78rFi1oCV5J/
         4fRrNtg4/g+pU1018D/BB8qoiaX0rmn2dN3sijhy2+yUKTMcRnfWTexsVSP227zL0tg+
         EN0XArnbMcgJwIUfpODEK/EyfHIbSlPm/gz7Cu7qhJHgOrU7x/S1kxPUz7XbFGfjJ4DE
         Hhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745810515; x=1746415315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8yYHt/qUGB7zSsH1QYJ0433S7HWdvxYqg3YPVEOlQg=;
        b=MWz/aFFhy+g+RAYzG8bSxW3zC+FyzxV4HAxQmZjI6LasA8dMeadips073WIEc378NS
         ox82FMEpopucPzWfw5dXQv20mo6woJ3C2z6tyCtxUJ7bgFASSCvC26og3L96lLkbYUEi
         Q0ypav5nfMK9U1tj9iIvrJVuBiX9R0jx/lLJvCiuKjubMpxPzqUnaw+41sAdP0HbjD80
         Kga2f04OgC/mj5X279Oz4lsUJDCdR1od1+ZEiDS/6wT8/M4IOwtgZ1DrdgPG//lquSNG
         zg8GEpN4yiyR7QeZPNlSV+wFqYGwxEMgk/dgKs0aRUoS9YxfshtcrsTAmEuyesD79ULB
         7ipg==
X-Forwarded-Encrypted: i=1; AJvYcCWgkfwv3Om93Unix/U3SsbBLPx3+kLJ78wogX79hMZkMqi9XG0hYpqcbQhHBCBSEUpqSQ+fHnI06nsq0/rKedS9@lists.infradead.org, AJvYcCXCCuaEzT28dBzP/8aYV9lcH3YyusNjkDXUejTtdiNaCWtrOHvbdQEy9IoURCkXrdSkjV5CIYODDDbLIhp/5Rg=@lists.infradead.org
X-Gm-Message-State: AOJu0YylvWafR8M6iS4b3qCMdbL9Ck+mqOmVtK3vzPXXCetDV/Ez287D
	baTSGKn97FgysjCtsqDi6N0kJuwMLu1BCCWJGUYV6xDBQMwE7nRf
X-Gm-Gg: ASbGncuAzRxd09yP7uQp9WRh/bmLRgZbpaq6wD+7+8QPN6toslcYm8DHEoJDmIyb5rq
	vA+1jK02wEQ6AHe++cRQZ4n3R6KwUZEsZ6ECp6peSNy+kEhCMXYH3P/xRV+W4d0JhTPZZu5RNTX
	ZP1ARFCdqzW1gct5xkGbEneJR4lPTd+zc+CbrcllYYQ9/7Wih88E7bajYAu+NLuWK/mF8LJ3JYR
	cqB8qPkU5lwWDOMPyg3HwiY68PTczSWjoQbTyT7eRh6Wjx9oedHQNRzxAlLMOPzgcLtM9LVnoLX
	0Rk8op5qRkjWNftudUOndXLuLExYO6Prqtp2tlLPym98pHguoYF2aaO2qDcmIsu88g==
X-Google-Smtp-Source: AGHT+IF/CLnoxiVHuh9PWG8WGXhLiWoz1DQBShtf6eNa/Qh4SLnUeeqIbL2Bzlfj9Hx2I5otXfwjrw==
X-Received: by 2002:a05:6a00:3a18:b0:736:69aa:112c with SMTP id d2e1a72fcca58-73fd6df0163mr12454077b3a.9.1745810514895;
        Sun, 27 Apr 2025 20:21:54 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a965sm6878299b3a.118.2025.04.27.20.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 20:21:54 -0700 (PDT)
Message-ID: <641c7e8f492196d3ec08e7bd4adf212479a9b966.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] PCI: dw-rockchip: Remove unused
 PCIE_CLIENT_GENERAL_DEBUG
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 	shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Niklas Cassel <cassel@kernel.org>
Date: Mon, 28 Apr 2025 13:21:47 +1000
In-Reply-To: <20250423105415.305556-2-18255117159@163.com>
References: <20250423105415.305556-1-18255117159@163.com>
	 <20250423105415.305556-2-18255117159@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_202156_293162_1520EFDB 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, 2025-04-23 at 18:54 +0800, Hans Zhang wrote:
> The PCIE_CLIENT_GENERAL_DEBUG register offset is defined but never
> used in the driver. Its presence adds noise to the register map and
> may mislead future developers.
>=20
> Remove this redundant definition to keep the register list minimal
> and aligned with actual hardware usage.
>=20
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> ---
> =C2=A0drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 0e0c09bafd63..fd5827bbfae3 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -54,7 +54,6 @@
> =C2=A0#define PCIE_CLIENT_GENERAL_CONTROL	0x0
> =C2=A0#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> =C2=A0#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
> -#define PCIE_CLIENT_GENERAL_DEBUG	0x104
> =C2=A0#define PCIE_CLIENT_HOT_RESET_CTRL	0x180
> =C2=A0#define PCIE_CLIENT_LTSSM_STATUS	0x300
> =C2=A0#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)

Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>


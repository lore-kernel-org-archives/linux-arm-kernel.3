Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B97BC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/h4icl4bJ4iZhQsY5JlIHbZk1g8xMGb+vnYxZQzIJw8=; b=cpi1mh1VvWBr+Fw/kY5BTVmnan
	aKPBkiGdbPXopwrK81yTMpKTVQiXmVhFGxfQ70CTUZJYP1biGbWOY9Q6blVwL2Nfr1LJp3S+xR6Wg
	W/1yC7P6tZGB6Xm/7VJHQk8NAeznxIl8OKUs8If6vc3vqnEAlY4EnFAh+fI0sIGIg3gAYdUn+dWPV
	ZQoRxcbbQqyelk1p8iGyyhPVuhH7M/AssSX7ZDvAu/jsbo0LSSqc5VIprtKFcLZjmP0NIO8Mj/Oyi
	foOLPd18IL+cMlsA6Us6m7WsZoYRGrTFz6+tNB1aX0xATlV27WzV7sovwnPWAXxXnLLVzhT5ogK9f
	pfHJEasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CzX-00000007AZo-3e3l;
	Tue, 22 Apr 2025 12:44:47 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BvP-00000006yCs-22x1;
	Tue, 22 Apr 2025 11:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=/h4icl4bJ4iZhQsY5JlIHbZk1g8xMGb+vnYxZQzIJw8=;
	b=ROQuW9o1y2i4S7lZJHDMjqdJKr9LmZjYaKLRJCSit8lKC5hNJkfJTzirIOYiUJ
	+ecUGD0PVEsA+Hp9rEKPhBOaZg8zxaNi1GAWSSFleiOuti+CSj5XmH9FZdGWXo5z
	+lQGOb41PLR38/E0yFP9aNnaQrJAI6PZWbmmilAz3C8pU=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCX+C0efwdoQhSoBg--.12996S2;
	Tue, 22 Apr 2025 19:36:00 +0800 (CST)
Message-ID: <255a74b6-c16b-480e-b377-d87b3b6913b6@163.com>
Date: Tue, 22 Apr 2025 19:35:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
To: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250422112830.204374-1-18255117159@163.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250422112830.204374-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCX+C0efwdoQhSoBg--.12996S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr45XryfJw1DGw4xJr15twb_yoW5JFyxp3
	Z8JFWfur43Jw4Ivan7Cw17ZFy8K3ZrAFyYgw4UKw18Ja40q3W8WFyfKF1F9Fy2qr4xKF12
	q39rX34I9F4ava7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsSdgUUUUU=
X-Originating-IP: [61.171.199.116]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOg83o2gHfDNa2wAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043627_945469_2F978413 
X-CRM114-Status: GOOD (  14.19  )
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



On 2025/4/22 19:28, Hans Zhang wrote:
> 1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
> 2. PCI: dw-rockchip: Reorganize register and bitfield definitions
> 3. PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 
> ---
> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
> 
> Bjorn Helgaas:
> These would be material for a separate patch:
> 
> - The #defines for register offsets and bits are kind of a mess,
>    e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
>    PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
>    PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
>    names, and they're not even defined together.
> 
> - Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
>    PCIE_RDLH_LINK_UP_CHGED, which are in PCIE_CLIENT_INTR_STATUS_MISC.
> 
> - PCIE_LTSSM_ENABLE_ENHANCE is apparently in PCIE_CLIENT_HOT_RESET_CTRL?
>    Sure wouldn't guess that from the names or the order of #defines.
> 
> - PCIE_CLIENT_GENERAL_DEBUG isn't used at all.
> 
> - Submissions based on the following v5 patches:

I'm very sorry. It should be like this:
- Submissions based on the following patches:

> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-1-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-2-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-3-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
> ---
> 
> Hans Zhang (3):
>    PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
>    PCI: dw-rockchip: Reorganize register and bitfield definitions
>    PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 58 +++++++++----------
>   1 file changed, 29 insertions(+), 29 deletions(-)
> 
> 
> base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
> prerequisite-patch-id: 5d9f110f238212cde763b841f1337d0045d93f5b
> prerequisite-patch-id: b63975b89227a41b9b6d701c9130ee342848c8b6
> prerequisite-patch-id: 46f02da0db4737b46cd06cd0d25ba69b8d789f90
> prerequisite-patch-id: d06e25de3658b73ad85d148728ed3948bfcec731



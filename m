Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4977E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOtYJ/4fuEb2AjwCiDYcEOfXLlyiZIOg+Et+T8SsFS0=; b=RA+5WqNek7YwDz27G6Gcvu5zTH
	Q0v0vAWOSsWdfG+JJyCYpy4IKJruR+Sec5FdyWX+4L0FFSmxz4HX/3wPxv3V8svu4xbEOqUAhCGy3
	WbTrQyhOoMsgj4j6csAJFBtIYT7fO4zFZoqvt/AhDmPwXUUCWfFI8bQYBfjx3ruz4ZT0YPEUS0fxh
	jOX++RNFSfwG74nD/Po3BPPW7/XyrP5xvnikKF/9gufgJyYGmzHUayli+LWAM8DC2dvEW+lRup7VN
	HtjTVQZNw0cuxSFNZmrmayTmuXdccs8F00XuAGA4sHwhWJd+DdbpKFHLf9nyQ+ebgtuHtmOidV5Ly
	gMjiv2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj9h-00000000cdt-09wR;
	Mon, 06 Jan 2025 09:12:13 +0000
Received: from mail-m32102.qiye.163.com ([220.197.32.102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj7I-00000000cBb-0fNl;
	Mon, 06 Jan 2025 09:09:45 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7d472a1c;
	Mon, 6 Jan 2025 17:09:36 +0800 (GMT+08:00)
Message-ID: <48e5f547-0f7a-406f-990e-6ec3e5df3e8f@rock-chips.com>
Date: Mon, 6 Jan 2025 17:09:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/17] phy: phy-rockchip-samsung-hdptx: Add the '_MASK'
 suffix to all registers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-7-damon.ding@rock-chips.com>
 <3dgfsscqpvlqzajjeav6oneeyae2tpc46av7hadgon5uwqibg5@ubziqwztp62m>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3dgfsscqpvlqzajjeav6oneeyae2tpc46av7hadgon5uwqibg5@ubziqwztp62m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0ZS1YaHUsfSkxOS0hJTE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943ae0763003a3kunm7d472a1c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxQ6SAw4CjITEx8wGBxKTEtK
	TA0aCyJVSlVKTEhNSk5PTkxDSkpNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOQkI3Bg++
DKIM-Signature: a=rsa-sha256;
	b=PiuwPbAqxmEFBwTa2T0HrOX4XUXA3zPt+sglkv0JcB16IrLZpVbngO+jbHH4Mya55DrE/dTmA0yKZYELC6l/GAiO5N0hshCpCngbvtwiGZkY6IDqplB148jYLo69e1HURmXFLi3CgjIeYHJVE34Om3fHBpslXUaCrFqRCYWGLWU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=IOtYJ/4fuEb2AjwCiDYcEOfXLlyiZIOg+Et+T8SsFS0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_010944_698614_02E12054 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi Dmitry,

On 2024/12/30 20:34, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 02:33:02PM +0800, Damon Ding wrote:
>> Adding the '_MASK' suffix to all registers ensures consistency in the
>> naming convention for register macros throughout the file.
> 
> Nit: usually it would be "Add the '_MASK' suffix [...] in order to
> ensure consistency [...]".
> 

The commit msg will be fixed in next v5 patch series.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

Best regards
Damon


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B29C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 01:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xDxoJZ2z;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ge7N/YRv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BLytvqSWYrBr7L9UFKswaQyVlCa3Rxe50pFv8VUZDS4=; b=xDxoJZ2zUB2LAV
	TqbhnrF9Q4PhuRjEJcIyjKegJQFZhgw5hgrs5059FjRKtObkqTVSLFm2FYqOp9gAhpWcrmELAITg7
	iZUBgtRyt+ULSYsit44tihIdx+ivXQrS1C/wmzMpH4NbPLy8SWuQk+8RdLXl73OnrUzUiyl929Qxn
	DhrVdWhm8Mer61RGy8McQ8JjYI1OBMNquCyeRaVlE2Whfm8ZcHGhGrZciLHRTPEeBFRFSyJBzd0Ai
	Km2ikiPtmdZwQ87O9e+3mIN6LonjR+Mp7YKRb/z+78BS8nrU58kOT9PGkqiTPWJvTLIhKIslNZk2b
	ZTiCzNE+aQxw1yWsBOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLViE-00000003ZtE-3gUo;
	Tue, 27 Oct 2026 01:10:50 +0000
Received: from mail-m16023652232.xmail.ntesmail.com ([160.236.52.232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLViA-00000003Zsf-2kvp;
	Tue, 27 Oct 2026 01:10:49 +0000
Received: from [172.16.12.11] (gyproxy-mailtls0-entmail-virt215.gy.ntes [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 526f37367;
	Tue, 27 Oct 2026 09:10:37 +0800 (GMT+08:00)
Message-ID: <080cffd7-05e6-458d-a00a-b757b0f44aa5@rock-chips.com>
Date: Tue, 27 Oct 2026 09:10:37 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pmdomain: rockchip: Add RK3572 boot peripheral
 domains
To: Heiko Stuebner <heiko@sntech.de>, 1579567540@qq.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20261026-add-board-ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com>
 <18fcfe7a-e25a-4516-810f-d787b779914d@rock-chips.com>
 <d4e92131-ceb8-4143-b8f8-21e7f9638bdb@rock-chips.com>
 <3329883.fEcJ0Lxnt5@phil>
From: Finley Xiao <finley.xiao@rock-chips.com>
In-Reply-To: <3329883.fEcJ0Lxnt5@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17ae8c54403a8kunm924ab6b13756aa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU9JVk9PTEpJS0tKHkxOHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ge7N/YRv32U28Nwb4OcpHegrzM3yN4taMwOhX154ZZfvgCLbC/59Dy+jBHoNCN4aZRuWMU6xP31hcCM06/Q6kvWr4kjlclrKMl6OYR6h0L4Un6JhNlzizXNtQVkTp1rNW/B4MoldNvGfKJ7v6ugcamg/VxO/6JxWOr0ugEPLnGg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=BLytvqSWYrBr7L9UFKswaQyVlCa3Rxe50pFv8VUZDS4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_181047_285776_D653FF20 
X-CRM114-Status: GOOD (  12.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


在 2026/10/26 19:53, Heiko Stuebner 写道:
> Hi Finley,
>
> Am Montag, 26. Oktober 2026, 12:37:06 Mitteleuropäische Normalzeit schrieb Finley Xiao:
>> 在 2026/10/26 16:47, Finley Xiao 写道:
>>> 在 2026/10/26 11:21, Cunhao Lu via B4 Relay 写道:
>>>> From: Finley Xiao <finley.xiao@rock-chips.com>
>>>>
>>>> Add support for the RK3572 NVM0, NVM1, PHP, and VOP power domains.
>>>>
>>>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>> I have to point out that the changes (the shutdown/restore
>> rework, pending-state tracking, etc.) were not made by me, and I have
>> not reviewed them in detail. Therefore, I should not remain as the
>> author (From:) of this patch, nor should my Signed-off-by be kept on
>> it.
> As this seemingly comes from the vendor-tree, _some_ Rockchip authorship
> should be kept I think?
>
> Do you have a suggestion who that should be other than you? :-)
We have never carried code like this, and the other parts also
differ significantly from the Rockchip kernel. It does not appear
to be our original code.
>
> I guess as you suggested splitting this anyway, that authorship
> could also be split.
>
>
> Thanks
> Heiko

-- 
Best regards,

底层平台中心 肖锋（Finley Xiao）
************************************************************************************
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.
福建省福州市铜盘路软件大道89号软件园A区21号楼 350003
No.21 Building, A District, Fuzhou Software Park, Fuzhou, Fujian 350003, P.R. China
Tel: 0591-83991906-8602 Mobile: 18506057603
************************************************************************************



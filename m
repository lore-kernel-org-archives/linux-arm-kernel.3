Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8420C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfT47f4YC4sHbAPf2iUwhK0CCB8qwr74xhJZbfhK/ps=; b=UYwYAbuINL4upftCtkgjVmfCLR
	MKKN06cVeaG8xvlIj2EwjW6/vU93fifg1DFWYDo1jPcCC2I0cNLb1Bu85A8woGOl5VRwDGSc4Y6f+
	H0qmVEbsYmP8qN+BYcxZ9nn3rIfLF/R3Lhuawk2jTHdUPyLUVu/bSc2CX7eVs6nnbnfiGWI4kU+q0
	6FIx4ViqzEJd6FFEReyXlLi7JK97IR4BxV/Dg5735TA1DbZBdElpzGLuONZmAWnfRRCn0UABpw1JB
	2U+EYcusHmjYDirluUUHLEsf27HFcVMF3+L23++YmxgUfHnD2/mGlSCCruj1VjjgMn81CWGIPmhZk
	RhllQ3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObHR-000000044qj-3Yas;
	Mon, 09 Jun 2025 12:07:09 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObB5-000000044Cn-3jNu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 12:00:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559C0WvK1981245;
	Mon, 9 Jun 2025 07:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749470432;
	bh=KfT47f4YC4sHbAPf2iUwhK0CCB8qwr74xhJZbfhK/ps=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GKuIMGu3dJbx5hNpKhFmX5+IK+tGAbVy4vEAxw1Q6yZ98XOmPk3irPVZq6ws9XEBV
	 EWOhujqkY0c6jLRvCmDfdP4WUcPrZEHmA0J78eB51IbHMaPg6b2X+GWMQ/QkJ+bn8t
	 8fan9QnqIGpP6ewa5BUn7VKYMaa/hHb3dDIod7Q4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559C0W431356753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 07:00:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 07:00:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 07:00:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559C0Wfc1365631;
	Mon, 9 Jun 2025 07:00:32 -0500
Date: Mon, 9 Jun 2025 07:00:32 -0500
From: Nishanth Menon <nm@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
Message-ID: <20250609120032.yxmcyiw7dchv2kmp@wanted>
References: <20250603042448.783956-1-u-kumar1@ti.com>
 <20250603160147.47orn74obh2lz3qm@rethink>
 <51c56999-5f47-45fd-a4b2-4b79ecae0227@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51c56999-5f47-45fd-a4b2-4b79ecae0227@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_050036_022147_27BEF7CD 
X-CRM114-Status: GOOD (  19.01  )
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

On 12:47-20250608, Kumar, Udit wrote:
> Hello Nishanth
> 
> On 6/3/2025 9:31 PM, Nishanth Menon wrote:
> > On 09:54-20250603, Udit Kumar wrote:
> > > From: Bhavya Kapoor <b-kapoor@ti.com>
> > > 
> > > This commit adds the assigned-clocks and assigned-clock-parents
> > > properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
> > > property is set to reference the clock identified by
> > > "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
> > > correct clock source.
> > > 
> > > The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
> > > as the parent clock. This configuration is critical for establishing
> > > the proper clocking hierarchy, enabling the UART device to function
> > > reliably across different baud rates.
> > Please fix the commit message - not clear what specifically in the clock
> > hierarchy does permit the multiple baud rates.
> 
> need your advise here .
> 
> unlike other UART of main domain.  wkup_uart currently has two parents clock
> (clock-1 is at 96Mhz and clock-0 is at 19.2 Mhz).
> 
> By default, current fw selects clock-1 as parent.
> 
> Let me know, if explicitly we need to set parent as clock-1.
> 
> If yes then i will roll out v2 with current message , if no then please drop
> this patch

I personally do not see a need for the patch, then.
> 
> Thanks
> 
> Udit
> 
> > 
> > > Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> > You need to add your SoB.
> > > ---
> > > Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
> > [..]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


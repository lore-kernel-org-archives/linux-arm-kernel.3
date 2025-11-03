Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29FECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 02:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0yWbu7y1QVa2c8kKeP3bloSf5n0MlRqUOGmDNRFYWs=; b=MQxAbvk8i5irtavOvB0A/oinTE
	ULjW4uKw+mLuY6eJnkUJhMpwWbIZhxPJG7JsCdUFlI7ozy6t8ZmMMOGHubLrbGNGgpwuP24sTbcFw
	7Vv/m66ruhCmc37NXyD8SIdjlpuiVRds0mOUincGma22dinVr04BSzrd+jSslt+p4oODgWcd1fFH4
	2eLQmOV27R+hXJVL5nSHzZAg8A9u00W73nt/gsBxAIqdmn9L8JwsfsE4B1DyZVxALv330Wo6MF3mk
	7alyMnYcx3+jdf1WgTrDOyqBirLLQQ1DkrNfuwUEWrExXq5v8vMN3aPKqShCHVNfGXRdJkZ0e2Fd0
	BFCxor4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6Pw-0000000Axer-35rA;
	Tue, 04 Nov 2025 02:05:04 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6Pu-0000000Axe9-1xH3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 02:05:03 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0sGd5r2Xz9th6;
	Tue,  4 Nov 2025 03:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762221897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0yWbu7y1QVa2c8kKeP3bloSf5n0MlRqUOGmDNRFYWs=;
	b=RtgfVc6BU5L52qXx6mbD7p7VtqF4yj+yLn55bS3cm5xcC4cm9RS19rhx7NeFUYWAsg8KpG
	E8A+X2LgR4HdJRRXGiyl6zt3aCz38ZsfLE+ssHatAOXcdM7+29FsSUW0WZm/yzWChe+XDi
	CRF1VpVsx8xqcG7FVeD38C3U9unZ3XbB4ys7Df1kL2e8DEj/nEN2BW+10XY0v4sCkzO+sH
	gYbSDjqwNPHG0/Xx43THSDWf0dE0uXHBdTBAdxr1q40ImSVqONPKXIiYQ8IjrDq0qdSjnV
	7CY3eG+avTc+gbbY66ug9hli5gN7Ix4L/Ig5Pc18wCXOfMyYpptResjQWu9RzA==
Message-ID: <b8f61be8-281a-4057-bb05-c7d106e53f01@mailbox.org>
Date: Tue, 4 Nov 2025 00:47:58 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: shawnguo2@yeah.net, airlied@gmail.com, boris.brezillon@collabora.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org> <aP7DZCMk1pQ7wsFo@dragon>
 <aQB88c_AEC1RAZtH@oss.nxp.com> <aQCIAfyUC6N5y2fB@dragon>
 <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
 <aQhd0Ri4CviuGMOE@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aQhd0Ri4CviuGMOE@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: azhnsga89ktmxpihnm4emkymm3cay3uo
X-MBO-RS-ID: ab159e2ebd1e51d8cf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_180502_654760_2C8535D1 
X-CRM114-Status: UNSURE (   9.49  )
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

On 11/3/25 8:46 AM, Rain Yang wrote:

Hello Rain,

> thanks for your patch to make i.MX95 GPU upstreamed.
> Maybe I didn't express it clearly in the previous e-mails.
> the always-on GPUAPB clock must be removed, otherwise, it will result in redundant and unnecessary
> function call to M33.

DT should describe the hardware fully, that means DT should also 
describe the clock. Why should this clock description be removed from DT 
? The SCMI clock call over SMT transport is cheap.

-- 
Best regards,
Marek Vasut


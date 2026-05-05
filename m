Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD35FFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=; b=xFMkcqSYvEFJgtLNDl/hMQfrtj
	XuKguBdMGw4q87q0VpZ4mcQ8cLH2A0YOTaHLfj7OBZozdUxTWcPhzotQXwJQXyUMjqkfar7gGhM/E
	Y3WXZGca7dYV7/pOr+cpuAXB6UILWU5io3hU+cnE8jEYKhxGWKixnQYLxPVj38E0X1/VfYNjFJ9RJ
	lWb/kizNgGQeD7r2eXST33QDY19nEJ/1xjZxJo5ltt0GOdPnRxcXrZWO41dtxa9k6G8GXQIu91d+D
	eYv6DxClK3GQ7TKrLTaC90UI1MKPQmfaL86Ho1F+NxJ8todZaaX5XYy7yPm0y+/Ue3weKY9qmxFQg
	xvjJWWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNiz-0000000HaVU-3PEG;
	Tue, 05 May 2026 21:54:41 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNix-0000000HaUz-2BD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:54:40 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so5965001eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778018078; x=1778622878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=MTWu+pYrFV/Ylyep5qxyCVr7ypSwM6cUBBBbpI4Mtqd0A4Sgx4TUr4MivwDu7BJzW7
         e7T37NuIm7H+lZUkCaX4UKN4/COSiIpweJKQshNoPFgKEb0q52/olPF2YOVNxo4YrQIW
         LZOj/ikL9WArATO8PJplcNRA3H+0d3hE/P353sZzKGr1w2qihCYbJ6BCk9kfA474ysVV
         hP0gagSd+lvD1BGZdHCPQzjLjQf1EHylJaxdHkifZ0wTDPSR4+a/frcZv4EgNAGNvWij
         5NZduxr49Xd5JsCREwCcRrJvmYoGN2yHz0/QR+dHkObXbQwvJi1ahuBa4Kv0lhy+8Ivz
         d/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778018078; x=1778622878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=oZSkJdB5xVTYU1DOgwE1Y+NKe+eaeZtRs9yf0Pkki+fDfhBEdD4eilSPuCDeHclan8
         PE7+wmkDrfTcb8dOX98clAm8fgT3AzsUZlz7JSErAJuvFxu7kCbM9q+5T24FJRWCginc
         dpuDIaLNpyiNXyoPXnUI2a9gccnD9V0vR1h87rde5KJVdfMeB7FSvz0BPfr3E+0TSdn9
         snLUGcoxqzpUrwfltBw94x3joRuuMk/MbCqyM2UT/9J5b/hAfJyrYYu0Z6bXRzJ70XEY
         LPRqCFPyWB6VGNgeEM9rFOfxMem5iXCgmRK8niwfisMwcMOxcKEaxwg5uz2GS4pCBVwK
         tAsg==
X-Forwarded-Encrypted: i=1; AFNElJ/oEpjfJMaFkjLR0V03EV/Ag+9cNx3xfeBzYarrvGtA+aMBwMDQ4SHrbYGCOkIXcN1OJ70TLFkiV25aenpXVXu6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm5+Xa9hGQgetP3y12j/iVhfqxZCnrFV7RSqsUW7zO2ZlDwVqJ
	PkWZ+BTx3WN3UouIMhvT2IbxzhfP054X6kVnG0ITIppKTR+RcuH+eVip
X-Gm-Gg: AeBDiesklhz9185wb0IUn12+rB27fyTUM8lxDcYmNuemOg35TWYQZLsqI9vLMpW2dIA
	r0Scjz2C5GpvwzV8gfw3RZkiMu2DPZulB2OVfVr3a/aT7RhGIIcavOLLyKwV+4r1YS5xNVfWBdC
	6H50NwJZS+YzBlYIWQ6l86ItspUrogjpSTwDdxPWVmZK8EmazPvnqLaGkPOOxR+xLKXMy9ZsJ7w
	qAH/p2fX7DIrPzd2NHWcbm+wKJKVmtkV8rAzC52n/qZlD/qD00SNzk1ywDOxn5jzagUH8ZfRehu
	28+0iEAcK1nwOl7q11Bfb/T2ge+UqavwobZlkkG8cExWqUvR52O5kHUJeavrkluuDgdduUJnoHw
	i1bDtNnt4OlTDEmjS3crmlYvX235/sUGwJhScIPx5P/oIX2hxoeMWE23qT2xv1OrJIdrZnsZDdm
	2LH576CIXFl8rlJxRNQO7X9lSulvhivTc633Pq3CgB1TyP2BteKMh8EGlvlrh8Hmgk1NJ8wi8CU
	uA=
X-Received: by 2002:a05:693c:8110:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-2f54a39074amr415753eec.28.1778018077853;
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:94ef:a6f3:2c96:2d58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec763fsm722870eec.4.2026.05.05.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Date: Tue, 5 May 2026 14:54:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] Input: support for STM FTS5
Message-ID: <afpmQKJilpgDqrpJ@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_145439_568167_2042E5E4 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, Apr 09, 2026 at 12:15:43AM +0200, David Heidelberg via B4 Relay wrote:
> Used on various phones. Minimal viable driver.
> 
> Includes device-tree enabling touchscreen on Pixel 3.
> 
> What is missing:
>  - switching between AP and SLPI mode (to be able to wake up phone by touch)
>  - firmware loading
>  - anything above basic touch
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied #1 through #8 (#5 with minor edits). 

Thanks.

-- 
Dmitry


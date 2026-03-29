Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F464F3D5FF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoMMN29rCjlTssl/sb7IrLHbqObUb3kJXY5MLEykLiM=; b=qeAq3ryNq7+77gF6xBUzgEnipx
	YOPba525XyQCWl3DcDw424Ox5gswLe7DYRWHpI6/QKUG9d7xEJ2lUYoE8W6Gk2b//+KcUHDC2B2MW
	hfgZpizhvJp64L8iBvgpbm3va+rOukvYs84EfoMWpNsjiRPum+ZpJMRAMsTNxGqPrGEbUe8XkPpm0
	YLmVTzA9CqFF75pOsTdGp68Ttmb1zOufOV3/M/qTOne3U3zO3Tj6rnFw7Md8LQyXrH7jGKkgpAJ1Z
	5fmhKH1Che3ytJKWnGqkb3PdGlQC9IjtAEqRMHZKjrG5ZUfXKyFOJBRKT5lan7iCxW+qVSUFD2mDr
	xNxrFwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mUd-00000009nLZ-3lju;
	Sun, 29 Mar 2026 09:31:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mUc-00000009nLS-2a0E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 09:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD7CF60054;
	Sun, 29 Mar 2026 09:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16CBC116C6;
	Sun, 29 Mar 2026 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774776697;
	bh=cf7EiqAqmNt1++juAAppGpRaFMZbgrO/ch+A1qT1Ils=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpFKiu8MUA3BE4p3S3RwpI1H7gy/I+ZEXymKIBahgdUsI2H47QFufaskjDC4hMyPP
	 7o4Z+VSaRjk7C/7fe5yBsdeKhZtivfa1oaiaQXWfXqWvy/vwQwU/70712HplnHv8w4
	 Sr9VBZ95rZ2CMVpdHM2TZHRxmaGgRZ1jcKbRJzTC3WtkAQY6UPbUX7v/X8iHD/oUX5
	 PTlIbfHhO6J+9CrXDj0vh35rqCdWCxDngckmybio8OnBTSMu50w7bvfrqYI2XJphV6
	 CFTKCzxAKgZGxOLz0vg2bxvklRnAWnMYirdjGsYBCI1QI9XBAHCeTmIP866lNzBzpx
	 lTd7FIGjFYCXw==
Date: Sun, 29 Mar 2026 11:31:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH v2 2/2] ARM: dts: st: spear: rename thermal_flags to
 st,thermal-flags
Message-ID: <20260329-starfish-of-eternal-storm-f16de5@quoll>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
 <20260329061523.98346-3-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329061523.98346-3-krishnagopi487@gmail.com>
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

On Sun, Mar 29, 2026 at 11:45:20AM +0530, Gopi Krishna Menon wrote:
> st,thermal-flags is a required property in SPEAr Thermal Sensor node,
> which is incorrectly written as thermal_flags in spear13xx.dtsi.
> 
> Rename thermal_flags to st,thermal-flags to fix the property name

Does this have an impact? If yes, then why no fixes? If no, then why
not? How this could ever worked? Maybe this is completely unnecessary.

We already talked about this and I don't get why this change is neeeded
and why we discuss the same problem.

Best regards,
Krzysztof


